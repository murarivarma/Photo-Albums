//
//  FiltersCollectionViewController.m
//  Photo Albums
//
//  Created by Murari Varma on 05/10/17.
//  Copyright © 2017 murarivarma. All rights reserved.
//

#import "FiltersCollectionViewController.h"
#import "PhotoCollectionViewCell.h"
//#import "Photo+CoreDataClass.h"

@interface FiltersCollectionViewController ()

@property (strong, nonatomic) NSMutableArray *filters;
@property (strong, nonatomic) CIContext *context;

@end

@implementation FiltersCollectionViewController

static NSString * const reuseIdentifier = @"FilterPhotoCell";

-(NSMutableArray *)filters {
    if(!_filters) _filters = [[NSMutableArray alloc] init];
    return _filters;
}

-(CIContext *)context {
    if(!_context) _context = [CIContext contextWithOptions:nil];
    return _context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier]; // Removed this because it is avoiding to set images.
    
    // Do any additional setup after loading the view.
    self.filters = [[[self class] photoFilters] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Helpers

+ (NSArray *)photoFilters {
    
    CIFilter *sepia = [CIFilter filterWithName:@"CISepiaTone" keysAndValues:nil];
    CIFilter *blur = [CIFilter filterWithName:@"CIGaussianBlur" keysAndValues: nil];
    CIFilter *colorClamp = [CIFilter filterWithName:@"CIColorClamp" keysAndValues:@"inputMaxComponents", [CIVector vectorWithX:0.9 Y:0.9 Z:0.9 W:0.9], @"inputMinComponents", [CIVector vectorWithX:0.2 Y:0.2 Z:0.2 W:0.2], nil];
    CIFilter *instant = [CIFilter filterWithName:@"CIPhotoEffectInstant" keysAndValues: nil];
    CIFilter *noir = [CIFilter filterWithName:@"CIPhotoEffectNoir" keysAndValues: nil];
    CIFilter *vignette = [CIFilter filterWithName:@"CIVignetteEffect" keysAndValues: nil];
    CIFilter *colorControls = [CIFilter filterWithName:@"CIColorControls" keysAndValues:kCIInputSaturationKey, @0.5, nil];
    CIFilter *transfer = [CIFilter filterWithName:@"CIPhotoEffectTransfer" keysAndValues: nil];
    CIFilter *unsharpen = [CIFilter filterWithName:@"CIUnsharpMask" keysAndValues: nil];
    CIFilter *monochrome = [CIFilter filterWithName:@"CIColorMonochrome" keysAndValues: nil];
    
    NSArray *allFilters = @[sepia, blur, colorClamp, instant, noir, vignette, colorControls, transfer, unsharpen, monochrome];
    
    return allFilters;
    
}

- (UIImage *)filteredImageFromImage:(UIImage *)image andFilter:(CIFilter *)filter {
    
    CIImage *unfilteredImage = [[CIImage alloc] initWithCGImage:image.CGImage];
    
    [filter setValue:unfilteredImage forKey:kCIInputImageKey];
    CIImage *filteredImage = [filter outputImage];
    
    CGRect extent = [filteredImage extent];
    
    CGImageRef cgImage = [self.context createCGImage:filteredImage fromRect:extent];
    
    UIImage *finalImage = [UIImage imageWithCGImage:cgImage];
    
    return finalImage;
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [self.filters count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.layer.shouldRasterize = YES;
    cell.layer.rasterizationScale = [UIScreen mainScreen].scale; //cell.layer - to avoid scrolling issues - for smooth scroll
    
    // Configure the cell
    cell.backgroundColor = [UIColor blackColor];
    cell.imageView.image = [self filteredImageFromImage:(UIImage *)self.photo.image andFilter:self.filters[indexPath.row]];
    //cell.imageView.image = nil;// [UIImage imageNamed:@"ntr.jpg"];//(UIImage *)self.photo.image;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
