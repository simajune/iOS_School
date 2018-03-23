
import UIKit

let NSDefault = UserDefaults.standard

class Item: NSObject {
    
    // MARK: - Variable
    var ItemImageName = String()
    var ItemTitleLabel = String()
    
    var ContentImageName = String()
    var Genre = String()
    var Date = String()
    var Platform = String()
    //Variable_End
}


class ItemGroup: NSObject {
    
    // MARK: - Variable
    var ItemGroupTitleLabel = String()
    var ItemSet = [Item]()
    // Variable_End

    func AddItem() -> [ItemGroup] {
        
        // New Item Group //
        let NewItemGroup = ItemGroup()
        NewItemGroup.ItemGroupTitleLabel = "NEW ARRIVALS"
        
        var NewItemSet = [Item]()
        
        let FirstNewItme = Item()
        FirstNewItme.ItemImageName = "NieR_Automata_Cover.png"
        FirstNewItme.ItemTitleLabel = "NieR: Automata"
        FirstNewItme.ContentImageName = "NieR_Automata.png"
        FirstNewItme.Genre = "Genre : Role-Playing"
        FirstNewItme.Date = "Date : 2017.2.23"
        FirstNewItme.Platform = "Platform : Playstation 4"
        NewItemSet.append(FirstNewItme)
        
        let SecondNewItme = Item()
        SecondNewItme.ItemImageName = "Halo_Wars_2_Cover.png"
        SecondNewItme.ItemTitleLabel = "Halo Wars 2"
        SecondNewItme.ContentImageName = "Halo_Wars_2.png"
        SecondNewItme.Genre = "Genre : Strategy"
        SecondNewItme.Date = "Date : 2017.2.21"
        SecondNewItme.Platform = "Platform : Xbox One"
        NewItemSet.append(SecondNewItme)
        
        let ThirdNewItme = Item()
        ThirdNewItme.ItemImageName = "Super_Robot_Wars_V_Cover.png"
        ThirdNewItme.ItemTitleLabel = "Super Robot Wars V"
        ThirdNewItme.ContentImageName = "Super_Robot_Wars_V.png"
        ThirdNewItme.Genre = "Genre : Misc"
        ThirdNewItme.Date = "Date : 2017.2.23"
        ThirdNewItme.Platform = "Platform : Playstation 4"
        NewItemSet.append(ThirdNewItme)
        
        NewItemGroup.ItemSet = NewItemSet
        
        
        // Sale Item Group //
        let SaleItemGroup = ItemGroup()
        SaleItemGroup.ItemGroupTitleLabel = "SALE PRODUCTS"
        
        var SaleItemSet = [Item]()
        
        let FirstSaleItme = Item()
        FirstSaleItme.ItemImageName = "Baldur's_Gate_II_Cover.png"
        FirstSaleItme.ItemTitleLabel = "Baldur's Gate II"
        FirstSaleItme.ContentImageName = "Baldur's_Gate_II.png"
        FirstSaleItme.Genre = "Genre : Role-Playing"
        FirstSaleItme.Date = "Date : 2000.9.24"
        FirstSaleItme.Platform = "Platform : PC"
        SaleItemSet.append(FirstSaleItme)
        
        let SecondSaleItme = Item()
        SecondSaleItme.ItemImageName = "Rise_of_The_Tomb_Raider_Cover.png"
        SecondSaleItme.ItemTitleLabel = "Rise of The Tomb Raider"
        SecondSaleItme.ContentImageName = "Rise_of_The_Tomb_Raider.png"
        SecondSaleItme.Genre = "Genre : Action-Adventure"
        SecondSaleItme.Date = "Date : 2015.11.10"
        SecondSaleItme.Platform = "Platform : Playstation 4"
        SaleItemSet.append(SecondSaleItme)
        
        let ThirdSaleItme = Item()
        ThirdSaleItme.ItemImageName = "Sim_CIty_2000_Cover.png"
        ThirdSaleItme.ItemTitleLabel = "Sim CIty 2000"
        ThirdSaleItme.ContentImageName = "Sim_CIty_2000.png"
        ThirdSaleItme.Genre = "Genre : Simulation"
        ThirdSaleItme.Date = "Date : 1993"
        ThirdSaleItme.Platform = "Platform : PC"
        SaleItemSet.append(ThirdSaleItme)
        
        let FourthSaleItme = Item()
        FourthSaleItme.ItemImageName = "The_Elder_Scrolls_IV_Cover.png"
        FourthSaleItme.ItemTitleLabel = "The Elder Scrolls IV"
        FourthSaleItme.ContentImageName = "The_Elder_Scrolls_IV.png"
        FourthSaleItme.Genre = "Genre : Role-Playing"
        FourthSaleItme.Date = "Date : 2006.3.20"
        FourthSaleItme.Platform = "Platform : Xbox 360"
        SaleItemSet.append(FourthSaleItme)
        
        let FifthSaleItme = Item()
        FifthSaleItme.ItemImageName = "World_of_Warcraft_Cover.png"
        FifthSaleItme.ItemTitleLabel = "World of Warcraft"
        FifthSaleItme.ContentImageName = "World_of_Warcraft.png"
        FifthSaleItme.Genre = "Genre : MMORPG"
        FifthSaleItme.Date = "Date : 2004.11.23"
        FifthSaleItme.Platform = "Platform : PC"
        SaleItemSet.append(FifthSaleItme)
        
        SaleItemGroup.ItemSet = SaleItemSet
        
        
        // Best Item Group //
        let BestItemGroup = ItemGroup()
        BestItemGroup.ItemGroupTitleLabel = "BEST PRODUCTS"
        
        var BestItemSet = [Item]()
        
        let FirstBestItme = Item()
        FirstBestItme.ItemImageName = "Grand_Theft_Auto_V_Cover.png"
        FirstBestItme.ItemTitleLabel = "Grand Theft Auto V"
        FirstBestItme.ContentImageName = "Grand_Theft_Auto_V.png"
        FirstBestItme.Genre = "Genre : Action"
        FirstBestItme.Date = "Date : 2014.11.18"
        FirstBestItme.Platform = "Platform : Playstation 4"
        BestItemSet.append(FirstBestItme)
        
        let SecondBestItme = Item()
        SecondBestItme.ItemImageName = "Dragon_Quest_VIII_Cover.png"
        SecondBestItme.ItemTitleLabel = "Dragon Quest VIII"
        SecondBestItme.ContentImageName = "Dragon_Quest_VIII.png"
        SecondBestItme.Genre = "Genre : Role-Playing"
        SecondBestItme.Date = "Date : 2004.1.27"
        SecondBestItme.Platform = "Platform : Playstation 2"
        BestItemSet.append(SecondBestItme)
        
        let ThirdBestItme = Item()
        ThirdBestItme.ItemImageName = "Diablo_3_Cover.png"
        ThirdBestItme.ItemTitleLabel = "Diablo 3"
        ThirdBestItme.ContentImageName = "Diablo_3.png"
        ThirdBestItme.Genre = "Genre : Role-Playing"
        ThirdBestItme.Date = "Date : 2012.5.15"
        ThirdBestItme.Platform = "Platform : PC"
        BestItemSet.append(ThirdBestItme)
        
        let FourthBestItme = Item()
        FourthBestItme.ItemImageName = "Final_Fantasy_X_Cover.png"
        FourthBestItme.ItemTitleLabel = "Final Fantasy X"
        FourthBestItme.ContentImageName = "Final_Fantasy_X.png"
        FourthBestItme.Genre = "Genre : Role-Playing"
        FourthBestItme.Date = "Date : 1992.12.6"
        FourthBestItme.Platform = "Platform : Super Famicom"
        BestItemSet.append(FourthBestItme)
        
        BestItemGroup.ItemSet = BestItemSet
        
        return [NewItemGroup, SaleItemGroup, BestItemGroup]
    }
    
    
}
