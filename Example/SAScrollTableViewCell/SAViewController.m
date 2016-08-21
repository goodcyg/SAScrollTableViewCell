//
//  SAViewController.m
//  SAScrollTableViewCell
//
//  Created by globalreach-dev on 03/05/2014.
//  Copyright (c) 2014 SA. All rights reserved.
//

#import "SAViewController.h"

static NSString *const SACellIdentifier = @"Cell";

@implementation SAViewController

#pragma mark - 
#pragma mark - Class

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
   
    if (self) {
        self.tableView.contentInset = UIEdgeInsetsMake(20.0f, 0.0f, 0.0f, 0.0f);
        [self.tableView registerClass:[SAScrollTableViewCell class] forCellReuseIdentifier:SACellIdentifier];
    }

    return self;
}

#pragma mark -
#pragma mark - UITableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SAScrollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SACellIdentifier];

    if (!cell) {
        cell = [[SAScrollTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SACellIdentifier];
    }

    /**
     *  set cell delegate to get events of selected media
     */
    cell.delegate = self;

    /**
     *  set cell tag to help get the position of selected media
     */
    cell.tag = indexPath.row;
    
    /**
     *  returned array of SAMediaObject objects that holds information about each media type.
     */
    [cell setMedia:@[
                     [SAScrollMedia mediaWithType:SAScrollMediaTypeVideoAsset
                                           object:[[NSBundle mainBundle] URLForResource:@"sample1" withExtension:@"mov"]],
                     [SAScrollMedia mediaWithType:SAScrollMediaTypeImageName
                                            title:@"Title"
                                           object:@"sample1.jpg"],
                     [SAScrollMedia mediaWithType:SAScrollMediaTypeImageURL
                                            title:@"Title"
                                           object:[NSURL URLWithString:@"http://lorempixel.com/250/250"]],
                     [SAScrollMedia mediaWithType:SAScrollMediaTypeImageObject
                                            title:@"Title"
                                           object:[UIImage imageNamed:@"sample2.jpg"]]
                     ]
     ];

    return cell;
}

#pragma mark -
#pragma mark - SAScrollTableViewCellDelegate

- (void)scrollTableViewCell:(SAScrollTableViewCell *)scrollTableViewCell didSelectMediaAtIndexPath:(NSIndexPath *)indexPath atRow:(NSInteger)row {
    NSLog(@"[SAScrollTableViewCell] row:%d, media selected:%d", (int)row, (int)indexPath.row);
}

@end
