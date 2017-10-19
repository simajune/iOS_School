
import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var artistLb: UILabel!
    @IBOutlet weak var genreLb: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //var userDic: [UserModel]?
    var albumModel: AlbumModel?
    var songList:[SongData]? {
        return albumModel?.songList
    }
    
    func createAlbumData() {
        self.albumModel = AlbumModel(albumModel: album)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.createAlbumData()
        
        self.titleLb.text = self.albumModel?.albumInfo.albumTitle
        self.artistLb.text = self.albumModel?.albumInfo.artist
        self.genreLb.text = self.albumModel?.albumInfo.genre
        tableView.dataSource = self
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = songList![indexPath.row].songTitle
        
        return cell
    }
    
}

let album:Dictionary<String,Any> =
    ["albumInfo":["albumTitle":"2집 Oh!",
                  "artist":"소녀시대",
                  "genre":"댄스"],
     "songList":[["songTitle":"Oh!",
                  "trackNum":1,
                  "artist":"소녀시대",
                  "writer":"김정배",
                  "playTime":12340,
                  "playURL":"http://music.naver.com/123"],
                 ["songTitle":"Show! Show! Show!",
                  "trackNum":2,
                  "artist":"소녀시대",
                  "writer":"김부민",
                  "playTime":10130,
                  "playURL":"http://music.naver.com/124"],
                 ["songTitle":"웃자 (Be Happy)",
                  "trackNum":4,
                  "artist":"소녀시대",
                  "writer":"이트라이브",
                  "playTime":12134,
                  "playURL":"http://music.naver.com/126"]
        ]
]

