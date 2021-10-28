//
//  ItemDetailsViewController.m
//  DubizzleClassified
//
//  Created by Ghassan Fathi Al Marei on 28/10/2021.
//

#import "ItemDetailsViewController.h"
#import "DubizzleClassified-Swift.h"

@interface ItemDetailsViewController ()

@end

@implementation ItemDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindData];
    [self.navigationItem setLargeTitleDisplayMode:UINavigationItemLargeTitleDisplayModeNever];
}

- (void)bindData {

    self.nameLabel.text = _selectedItem.name;
    self.priceLabel.text = _selectedItem.price;
    self.priceLabel.attributedText = [AttributedString getAttributedStringWithPrice:_selectedItem.price fontSize:16];
    self.dateLabel.text = _selectedItem.createdAt;
    [self loadImageView];
    
}

-(void)loadImageView {
    
    [ImageLoader loadURLWithUrl:[NSURL URLWithString: self.selectedItem.imageUrls] placeholder:[UIImage imageNamed:@"defaultImage"] cache:NSURLCache.sharedURLCache myImageView:self.fullImageView];

}


@end

