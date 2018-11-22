//
//  MyFrePublicationsViewController.swift
//  LeaCouch
//
//  Created by Alumnos on 11/20/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class MyFrePublicationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var frePublicationTable: UITableView!
    
    var freePublicationArray = [Publicationd]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Publicationx.setUpPublications()
        setUPFreePublication()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return freePublicationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let mcell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? FreePublicationTableViewCell else {
            return UITableViewCell()
        }
        
        // to update table search
        //cambiar currentCoachArray por currentResults
        if freePublicationArray[indexPath.row].isFree == "1" {
            mcell.titleLabel.text = freePublicationArray[indexPath.row].name
            mcell.viewsLabel.text = freePublicationArray[indexPath.row].views
            mcell.adateLabel.text = freePublicationArray[indexPath.row].adate
            mcell.descriptionsLabel.text = freePublicationArray[indexPath.row].adescription
            if let url = URL(string: freePublicationArray[indexPath.row].urlPhoto) {
                mcell.pictureImage.af_setImage(withURL: url, placeholderImage: UIImage(named: "file-unavailable"))
            }
        }
        
        return mcell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    private func setUPFreePublication() {
        freePublicationArray.append(Publicationd(name: "Material Design", adate: "12 de noviembre",adescription: "Material design es una normativa de diseño enfocado en la visualización del sistema operativo ", views: "15", urlPhoto: "https://leacoach.github.io/images/design.jpg", isFree: "1"))
        freePublicationArray.append(Publicationd(name: "Probabilidades", adate: "18 de setiembre", adescription: "La probabilidad es una medida de la certidumbre asociada a un suceso o evento futuro y suele expresarse como un número entre 0 y 1", views: "15", urlPhoto: "https://upload.wikimedia.org/wikipedia/commons/0/02/Vista_probabilidades_y_estad%C3%ADstica_GeoGebra.png", isFree: "1"))
        freePublicationArray.append(Publicationd(name: "Binomio de newton", adate: "08 de abril", adescription: "El binomio de Newton es un algoritmo que permite calcular una potencia cualquiera de un binomio", views: "10", urlPhoto: "https://upload.wikimedia.org/wikipedia/commons/a/af/Tri%C3%A1ngulo_Pascal_binomio_Newton.png", isFree: "2"))
        freePublicationArray.append(Publicationd(name: "Ecuaciones lineales", adate: "10 de octubre", adescription: "Es un sistema de ecuaciones en donde cada ecuación es de primer grado", views: "12", urlPhoto: "https://i.vimeocdn.com/filter/overlay?src0=https%3A%2F%2Fi.vimeocdn.com%2Fvideo%2F534825255_1280x720.jpg&src1=https%3A%2F%2Ff.vimeocdn.com%2Fimages_v6%2Fshare%2Fplay_icon_overlay.png", isFree: "1"))
        freePublicationArray.append(Publicationd(name: "Ecuaciones de cuadratica", adate: "25 de noviembre", adescription: "Una ecuación cuadrática es una ecuación de segundo grado cuyo exponente absoluto es 2", views: "5", urlPhoto: "https://i.vimeocdn.com/filter/overlay?src0=https%3A%2F%2Fi.vimeocdn.com%2Fvideo%2F542274940_1280x960.jpg&src1=https%3A%2F%2Ff.vimeocdn.com%2Fimages_v6%2Fshare%2Fplay_icon_overlay.png", isFree: "2"))
        freePublicationArray.append(Publicationd(name: "Matrices", adate: "27 de noviembre", adescription: "matriz se refiere a una formación o conjunto rectangular de elementos.", views: "4", urlPhoto: "https://upload.wikimedia.org/wikipedia/commons/f/fa/Cubic_family_polyhedra_vertex_figures_in_configuration_matrices.png", isFree: "1"))
        freePublicationArray.append(Publicationd(name: "Movimiento rectilineo", adate: "12 de noviembre", adescription: "El movimiento rectilíneo, es la trayectoria que describe el movimiento en una línea recta. ", views: "17", urlPhoto: "https://upload.wikimedia.org/wikipedia/commons/9/95/Cinematica_MOVIMIENTO_RECTILINEO_UNIFORME.png", isFree: "2"))
        freePublicationArray.append(Publicationd(name: "Trabajo y energia", adate: "12 de noviembre", adescription: "El trabajo de una fuerza no conservativa modifica la energía mecánica (cinética más potencial) de la partícula. ", views: "25", urlPhoto: "https://upload.wikimedia.org/wikipedia/commons/5/59/Diagrama_de_energia_pra_molecula_de_butano.png", isFree: "1"))
        freePublicationArray.append(Publicationd(name: "Caida libre", adate: "12 de noviembre", adescription: "se denomina caída libre al movimiento de un cuerpo bajo la acción exclusiva de un campo gravitatorio.", views: "15", urlPhoto: "https://upload.wikimedia.org/wikipedia/commons/5/53/Martillo_de_ca%C3%ADda_libre.jpg", isFree: "2"))
        freePublicationArray.append(Publicationd(name: "Limites e integrales", adate: "12 de noviembre", adescription: "Límites, derivadas e integrales. Límites; Derivadas; Integrales. Límites. En Maxima, todos los límites se pueden calcular con la función limit.", views: "7", urlPhoto: "https://upload.wikimedia.org/wikipedia/commons/5/54/Integral_riemann_animada.gif", isFree: "2"))
        freePublicationArray.append(Publicationd(name: "Valor del dinero", adate: "12 de noviembre", adescription: "es un concepto económico basado en la premisa de que un inversor prefiere recibir un pago de una suma fija de dinero hoy, en lugar de recibir el mismo valor nominal en una fecha futura.", views: "11", urlPhoto: "https://upload.wikimedia.org/wikipedia/commons/e/e4/EVALUACION_FINANCIERA_DE_PROYECTOS_DE_INVERSION.jpg", isFree: "2"))
        freePublicationArray.append(Publicationd(name: "Ecuaciones diferenciales", adate: "12 de noviembre", adescription: "Una ecuación diferencial es una ecuación que involucra derivadas (o diferenciales) de una función desconocida", views: "13", urlPhoto: "https://c1.staticflickr.com/3/2784/4521338513_c7ec64b49c_b.jpg", isFree: "1"))
        freePublicationArray.append(Publicationd(name: "Funciones 1", adate: "12 de noviembre", adescription: "una función f es una relación entre un conjunto dado X (el dominio) y otro conjunto de elementos Y (el codominio)", views: "52", urlPhoto: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Funciones_cuadr%C3%A1ticas_de_x_-_y.svg/1280px-Funciones_cuadr%C3%A1ticas_de_x_-_y.svg.png", isFree: "1"))
        freePublicationArray.append(Publicationd(name: "Ecuaciones trigonometricas", adate: "12 de noviembre", adescription: "En las ecuaciones trigonométricas intervienen funciones trigonométricas, que son periódicas y por tanto sus soluciones se pueden presentar en uno o en dos particiones.", views: "14", urlPhoto: "https://upload.wikimedia.org/wikipedia/commons/a/a5/Identidades_trigonom%C3%A9tricas_fundamentales.gif", isFree: "2"))
        freePublicationArray.append(Publicationd(name: "Triangulos 2", adate: "12 de noviembre", adescription: "Los triángulos obtusángulos pueden ser: Triángulo obtusángulo isósceles: tiene un ángulo obtuso, y dos lados iguales que son los que forman el ángulo obtuso; el otro lado es mayor que estos dos. Triángulo obtusángulo escaleno: tiene un ángulo obtuso y todos sus lados son diferentes.", views: "25", urlPhoto: "https://c1.staticflickr.com/7/6024/5962821486_fcce109dc0_b.jpg", isFree: "1"))
        freePublicationArray.append(Publicationd(name: "Cilindros", adate: "12 de noviembre", adescription: "un cilindro es una superficie de las denominadas cuádricas formada por el desplazamiento paralelo de una recta llamada generatriz a lo largo de una curva plana, que puede ser cerrada o abierta, denominada directriz del cilindro.", views: "19", urlPhoto: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Cylindric_section.svg/860px-Cylindric_section.svg.png", isFree: "1"))
        freePublicationArray.append(Publicationd(name: "Determinantes", adate: "12 de noviembre", adescription: "el DETERMINANTE es una operación que se realiza sobre matrices cuadradas cuyo resultado es un número real.", views: "8", urlPhoto: "https://i.vimeocdn.com/filter/overlay?src0=https%3A%2F%2Fi.vimeocdn.com%2Fvideo%2F599367578_1280x720.jpg&src1=https%3A%2F%2Ff.vimeocdn.com%2Fimages_v6%2Fshare%2Fplay_icon_overlay.png", isFree: "2"))
        freePublicationArray.append(Publicationd(name: "Estatica 2", adate: "12 de noviembre", adescription: "Parte de la mecánica que estudia las leyes del equilibrio de los cuerpos.", views: "14", urlPhoto: "https://upload.wikimedia.org/wikipedia/commons/d/db/Presntdinamestat.png", isFree: "1"))
        freePublicationArray.append(Publicationd(name: "Estequiometria", adate: "12 de noviembre", adescription: "Se denomina estequiometría al vínculo numérico que se establece entre las masas de aquellos elementos que componen una sustancia.", views: "17", urlPhoto: "https://i.vimeocdn.com/filter/overlay?src0=https%3A%2F%2Fi.vimeocdn.com%2Fvideo%2F509588114_1280x856.jpg&src1=https%3A%2F%2Ff.vimeocdn.com%2Fimages_v6%2Fshare%2Fplay_icon_overlay.png", isFree: "2"))
        freePublicationArray.append(Publicationd(name: "Derivadas", adate: "12 de noviembre", adescription: "En matemáticas, la derivada de una función mide la rapidez con la que cambia el valor de dicha función matemática", views: "5", urlPhoto: "https://c2.staticflickr.com/4/3040/2743755617_cab84f2a70_z.jpg?zz=1", isFree: "2"))
        
        //freePublicationArray
    }
}

class Publicationd {
    var name:String = ""
    var adate:String = ""
    var adescription:String = ""
    var views:String = ""
    var urlPhoto:String = ""
    var isFree:String = ""
    
    init(name: String,
         adate:String,
         adescription: String,
         views: String,
         urlPhoto: String,
         isFree: String) {
        self.name = name
        self.adate = adate
        self.adescription = adescription
        self.views = views
        self.urlPhoto = urlPhoto
        self.isFree = isFree
    }
    
}
