//
//  LeaveItemCell.m
//  LeaveApplication
//
//  Created by Anshad M K on 03/10/17.
//  Copyright © 2017 Anshad M K. All rights reserved.
//

#import "LeaveItemCell.h"

@interface LeaveItemCell ()

@property(nonatomic, assign) BOOL didLayoutConstraints;

@end

@implementation LeaveItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Getters

- (UILabel *)dateLabel{
    if(!_dateLabel){
        _dateLabel = [UILabel newAutoLayoutView];
        _dateLabel.backgroundColor = [UIColor lightGrayColor];
    }return _dateLabel;
}

- (UILabel *)reasonLabel{
    if(!_reasonLabel){
        
        _reasonLabel = [UILabel newAutoLayoutView];
        _reasonLabel.backgroundColor = [UIColor lightGrayColor];
    }return _reasonLabel;
}


#pragma mark - View Constraints

+ (BOOL)requiresConstraintBasedLayout{
    
    return YES;
}

- (void)updateConstraints{
    
    if(!self.didLayoutConstraints){
        
        [self addSubViews];
        NSDictionary *views = @{@"date":self.dateLabel,
                                @"reason":self.reasonLabel
                                };
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[date]-10-[reason]"
                                                                                 options:0 metrics:nil views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[date]"
                                                                                 options:0 metrics:nil views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[reason]-10-|"
                                                                                 options:0 metrics:nil views:views]];
        self.didLayoutConstraints = YES;
    }[super updateConstraints];
}

- (void)addSubViews{
    
    [self.contentView addSubview:self.dateLabel];
    [self.contentView addSubview:self.reasonLabel];
    self.contentView.backgroundColor = [UIColor darkGrayColor];
}

#pragma mark - Getters

- (void)reloadData{
    
    self.dateLabel.text = self.viewModel.date;
    self.reasonLabel.text = self.viewModel.reason;
}
@end
