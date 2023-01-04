//
//  ViewController.swift
//  tempo-cozimento
//
//  Created by Alan on 09/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    var tempo = 0
    var tempoCozimento = [
        "liquido": 120,
        "mole": 240,
        "medio": 360,
        "medio-duro": 600,
        "duro": 900
    ]
    
    
    @IBAction func ovoSelecionado(_ sender: UIButton) {
        switch sender.tag {
            case 0: tempo = tempoCozimento["liquido"]!
            case 1: tempo = tempoCozimento["mole"]!
            case 2: tempo = tempoCozimento["medio"]!
            case 3: tempo = tempoCozimento["medio-duro"]!
            default: tempo = tempoCozimento["duro"]!
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let controller: TimerViewController = segue.destination as! TimerViewController
        
        controller.tempoSelecionado = tempo
        controller.temporizador = tempo
        controller.estadoOvo = tempoCozimento
    }


}

