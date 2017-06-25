
import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    var partyRocks = [PartyRock]()
    
    @IBOutlet weak var tableView: UITableView!
    
    let vUrl1 = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wRRsXxE1KVY\" frameborder=\"0\" allowfullscreen></iframe>"
    let iUrl1 = "http://www.queeky.com/share/drawings/sports/33987/john-cena.jpg"
    override func viewDidLoad() {
        
        super.viewDidLoad()
      
        let p1 = PartyRock(imageURL: "http://www.borntoworkout.com/wp-content/uploads/2015/12/John-Cena-Workout.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/0gkpCqmSe-Q\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Cena Workout")
     
   
        let p2 = PartyRock(imageURL: iUrl1, videoURL: vUrl1, videoTitle: "John Cena Prank Call")
        let p3 = PartyRock(imageURL: "http://tomandlorenzo.com/wp-content/uploads/2015/08/John-Cena-Late-Night-Seth-Meyers-TV-Style-Tom-Lorenzo-Site-TLO-2.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/-gP-ifdgPhE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "John Cena Interview")
       // let p4 = PartyRock(imageURL: iUrl1, videoURL: vUrl1, videoTitle: "JOHN CENA!")
       // let p5 = PartyRock(imageURL: iUrl1, videoURL: vUrl1, videoTitle: "JOHN CENA!")
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
       // partyRocks.append(p4)
       // partyRocks.append(p5)
 
        
        tableView.delegate = self
        tableView.dataSource = self
 
           }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let partyRock = partyRocks[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell{
        cell.updateUI(partyRock: partyRock)
            return cell
        }
        else{
        return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
        
            if let party = sender as? PartyRock {
             destination.partyRock = party
            }
            
        }
    }
}

