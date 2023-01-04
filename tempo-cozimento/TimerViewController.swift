//
//  TimerViewController.swift
//  tempo-cozimento
//
//  Created by Aluno on 10/09/22.
//

import UIKit
import AudioToolbox
class TimerViewController: UIViewController {

    var tempoSelecionado = 0
    var temporizador = 0
    var tempoCozinhando = 0
    var descricao = "Estado do ovo: "
    var estadoOvo = [String:Int]()

    
    @IBOutlet weak var cronometro: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var estadoAtual: UIImageView!
    @IBOutlet weak var descricaoOvo: UILabel!
    
    func mostrarCronometro() {
        let minutos = temporizador / 60
        let segundos = temporizador % 60
        switch(minutos, segundos) {
            case(minutos, segundos) where minutos<10 && segundos<10: cronometro.text = "00:0\(minutos):0\(segundos)s"
            case(minutos, segundos) where minutos<10 && segundos>=10: cronometro.text = "00:0\(minutos):\(segundos)s"
            case(minutos, segundos) where minutos>=10 && segundos>=10: cronometro.text = "00:\(minutos):\(segundos)s"
            case(minutos, segundos) where minutos>=10 && segundos<10: cronometro.text = "00:\(minutos):0\(segundos)s"
            default: cronometro.text = "Seu ovo \n está cozinhando!"; AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }

    }

    @IBAction func iniciarCronometro(_ sender: UIButton) {
        sender.titleLabel?.isHidden = true
        UIView.animate(withDuration: Double(temporizador)) {
            self.progressBar.setProgress(1, animated: true)
        }
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self]_ in
            if(temporizador > 0) {
                temporizador -= 1
                mostrarCronometro()
            } else {
                cronometro.text = "Seu ovo \n está pronto!"
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            }

        }
        
        descricaoOvo.text = descricao + "cru"
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self]_ in
            if tempoCozinhando <= tempoSelecionado {
                tempoCozinhando += 1

                for (imagem, tempo) in estadoOvo {
                    if tempoCozinhando == tempo {
                        estadoAtual.image = UIImage(named: imagem)
                        descricaoOvo.text! = descricao + imagem
                    }
                }
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mostrarCronometro()
    }
    

    

}
