//
//  ViewController.swift
//  IMCSwiftIOS
//
//  Created by Mañanas on 22/7/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var avatarImage2: UIImageView!
    @IBOutlet weak var avatarImage3: UIImageView!
    
    @IBOutlet weak var num1: UITextField!
    @IBOutlet weak var num2: UITextField!
    
    @IBOutlet weak var resultDown: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var healthyLabel: UILabel!
    
    var height:Int = 160
    var weight:Float = 70
    
    //Images
    var avatarBaseUrl = "https://api.multiavatar.com/"
    var imageUrl = ""
    var imageUrl2 = ""
    var imageUrl3 = ""
    
    
    override func viewDidLoad() {
        resultDown.text = "0"
        result.text = ""
        healthyLabel.text = ""
        super.viewDidLoad()
       
    }
    
    @IBAction func onHeighChange(_ sender: UIStepper) {
        height = Int(sender.value)
        heightLabel.text = "\(height) cm"
    }
    
    
    @IBAction func onWeightChange(_ sender: UISlider) {
        weight = sender.value
        let formattedNumber = String(format: "%.2f", weight)
        weightLabel.text = "\(formattedNumber) Kg"
    }
    
    
    @IBAction func calculate(_ sender: Any) {
        let res = weight / pow(Float(height) / 100, 2)
        let formattedNumber = String(format: "%.2f", res)
        updateHealthStatus(result: res)
        result.text = "IMC: \(formattedNumber)"
        //Imagenes
        let numRandom = Int.random(in: 1...9999)
        let numRandom2 = Int.random(in: 1...9999)
        let numRandom3 = Int.random(in: 1...9999)
        imageUrl = avatarBaseUrl + String(numRandom) + ".png"
        imageUrl2 = avatarBaseUrl + String(numRandom2) + ".png"
        imageUrl3 = avatarBaseUrl + String(numRandom3) + ".png"
        loadImage(from: imageUrl, into: avatarImage)
        loadImage(from: imageUrl2, into: avatarImage2)
        loadImage(from: imageUrl3, into: avatarImage3)
    }
    
    
    @IBAction func sumButton(_ sender: Any){
        guard let text1 = num1.text, let number1 = Float(text1),
              let text2 = num2.text, let number2 = Float(text2) else {
            resultDown.text = "Por favor, ingresa números válidos"
            return
        }
        
        let sum = number1 + number2
        resultDown.text = String(format: "%.2f", sum)
    }
    

    @IBAction func resButton(_ sender: Any) {
        guard let text1 = num1.text, let number1 = Float(text1),
              let text2 = num2.text, let number2 = Float(text2) else {
            resultDown.text = "Por favor, ingresa números válidos"
            return
        }
        
        let res = number1 - number2
        resultDown.text = String(format: "%.2f", res)
    }
    
    
    
    @IBAction func mulButton(_ sender: Any) {
        guard let text1 = num1.text, let number1 = Float(text1),
              let text2 = num2.text, let number2 = Float(text2) else {
            resultDown.text = "Por favor, ingresa números válidos"
            return
        }
        
        let mul = number1 * number2
        resultDown.text = String(format: "%.2f", mul)
    }
    
    
    @IBAction func divButton(_ sender: Any) {
        guard let text1 = num1.text, let number1 = Float(text1),
              let text2 = num2.text, let number2 = Float(text2) else {
            resultDown.text = "Por favor, ingresa números válidos"
            return
        }
        
        let div = number1 / number2
        resultDown.text = String(format: "%.2f", div)
    }
    

    
    
    func loadImage(from url: String, into imageView: UIImageView) {
            guard let url = URL(string: url) else {
                print("URL no válida")
                return
            }

            // Crear una sesión de URLSession
            let session = URLSession.shared

            // Crear una tarea de descarga
            let task = session.dataTask(with: url) { data, response, error in
                // Manejo de errores
                if let error = error {
                    print("Error al descargar la imagen: \(error.localizedDescription)")
                    return
                }

                // Verificar que se hayan recibido datos
                guard let data = data else {
                    print("No se recibieron datos")
                    return
                }

                // Crear una imagen con los datos recibidos
                if let downloadedImage = UIImage(data: data) {
                    // Actualizar la UI en el hilo principal
                    DispatchQueue.main.async {
                        imageView.image = downloadedImage
                    }
                }
            }

            // Iniciar la tarea
            task.resume()
        }
    
    func updateHealthStatus(result: Float) {
            guard let healthyTextView = healthyLabel else {
                return
            }
            
            switch result {
            case 0.0..<18.5:
                healthyTextView.text = "Bajo Peso" // Reemplazar con NSLocalizedString("under_weight", comment: "") para localización
                healthyTextView.textColor = UIColor.orange

            case 18.5..<24.9:
                healthyTextView.text = "Normal" // Reemplazar con NSLocalizedString("normal", comment: "") para localización
                healthyTextView.textColor = UIColor.green

            case 25.0..<29.9:
                healthyTextView.text = "Sobrepeso" // Reemplazar con NSLocalizedString("overweight", comment: "") para localización
                healthyTextView.textColor = UIColor.yellow

            default:
                healthyTextView.text = "Obesidad" // Reemplazar con NSLocalizedString("obesity", comment: "") para localización
                healthyTextView.textColor = UIColor.red
            }
        }
   
   
}

