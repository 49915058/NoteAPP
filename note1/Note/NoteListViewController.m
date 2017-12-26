//
//  NoteListViewController.m
//  Note
//
//  Created by SSD on 2017/12/26.
//  Copyright © 2017年 classroom. All rights reserved.
//

#import "NoteListViewController.h"
#import "Note.h"
@interface NoteListViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *notes;
}
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation NoteListViewController
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        notes=[NSMutableArray array];
        Note *note=[[Note alloc] init];
        note.content=@"東西 %d ", 1 ;
        [notes addObject:note];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.dataSource=self;
    self.tableview.delegate=self;
}
#pragma mark add
- (IBAction)add:(id)sender {
    Note *note=[[Note alloc] init];
    note.content=[NSString stringWithFormat:@"東西%d",notes.count];
    [notes addObject:note];
    [self.tableview insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;{
    return notes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"left" forIndexPath:indexPath];
    Note *note=[notes objectAtIndex:indexPath.row];
    
    cell.textLabel.text=note.content;
    return cell;
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

@end
