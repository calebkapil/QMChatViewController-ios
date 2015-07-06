//
//  QMChatAttachmentOutgoingCell.m
//  sample-chat-swift
//
//  Created by Injoit on 7/1/15.
//  Copyright (c) 2015 quickblox. All rights reserved.
//

#import "QMChatAttachmentOutgoingCell.h"

@interface QMChatAttachmentOutgoingCell()

@property (weak, nonatomic) IBOutlet UILabel *progressLabel;

@end

@implementation QMChatAttachmentOutgoingCell

+ (UINib *)nib {
    return [UINib nibWithNibName:[self cellReuseIdentifier] bundle:[NSBundle bundleForClass:[self class]]];
}

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass([self class]);
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.attachmentImageView.image = nil;
}

- (void)setAttachmentImage:(UIImage *)attachmentImage {
    
    self.progressLabel.hidden = YES;
    self.attachmentImageView.image = attachmentImage;
}

- (void)updateLoadingProgress:(CGFloat)progress {
    
    if (progress > 0.0) {
        self.progressLabel.hidden = NO;
    }
    
    self.progressLabel.text = [NSString stringWithFormat:@"%2.0f %%", progress * 100.0f];
}

@end