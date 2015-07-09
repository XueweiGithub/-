//
//  subMarkerAry.m
//  Project
//
//  Created by sike on 13-7-30.
//  Copyright (c) 2013年 sike. All rights reserved.
//

#import "GlobalShare.h"

@implementation GlobalShare

static GlobalShare *sharedUserData = nil;

+ (GlobalShare*)getGlobalShare {
    if (sharedUserData == nil) {
        sharedUserData = [[super allocWithZone:NULL] init];
    }
    return sharedUserData;
}




+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self)
    {
        if (sharedUserData == nil)
        {
            sharedUserData = [super allocWithZone:zone];
            
            return sharedUserData;
        }
    }
    return nil;
}

//为确保 每次返回的都是同一块地址
- (id)copyWithZone:(NSZone *)zone {
    return self;
}



//清理用户信息
- (void)clearUserInfo{
    self.user.userId = @"";
    self.user.userPhone = @"";
    self.user.userNickName = @"";
    self.user.userPassWord = @"";
    
    
    //存储用户信息
    //[Utils saveData:self.user to:kSaveUserInfo];
}












@end







@implementation User
- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.userPhone forKey:@"userPhone"];
    [aCoder encodeObject:self.userPassWord forKey:@"userPassWord"];
    [aCoder encodeObject:self.userId forKey:@"userId"];
    [aCoder encodeObject:self.userNickName forKey:@"userNickName"];

    [aCoder encodeObject:self.departmentId forKey:@"departmentId"];
    [aCoder encodeObject:self.parent_id forKey:@"parent_id"];
    [aCoder encodeObject:self.position forKey:@"position"];
    [aCoder encodeObject:self.marketerId forKey:@"marketerId"];
    [aCoder encodeObject:self.accessToken forKey:@"accessToken"];
    
    
    
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        
        self.userPhone =[NSString stringWithFormat:@"%@",[aDecoder decodeObjectForKey:@"userPhone"]] ;
        self.userPassWord = [NSString stringWithFormat:@"%@",[aDecoder decodeObjectForKey:@"userPassWord"]];
        self.userId = [NSString stringWithFormat:@"%@",[aDecoder decodeObjectForKey:@"userId"]];
        self.userNickName = [NSString stringWithFormat:@"%@",[aDecoder decodeObjectForKey:@"userNickName"]];
        self.departmentId = [NSString stringWithFormat:@"%@",[aDecoder decodeObjectForKey:@"departmentId"]];
        self.parent_id = [NSString stringWithFormat:@"%@",[aDecoder decodeObjectForKey:@"parent_id"]];
        self.position = [NSString stringWithFormat:@"%@",[aDecoder decodeObjectForKey:@"position"]];
        self.marketerId = [NSString stringWithFormat:@"%@",[aDecoder decodeObjectForKey:@"marketerId"]];
        
        self.accessToken = [NSString stringWithFormat:@"%@",[aDecoder decodeObjectForKey:@"accessToken"]];
        
    }
    return self;
}


@end

@implementation SystemInfo


- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.isLogin forKey:@"isLogin"];
    [aCoder encodeObject:self.isFirst forKey:@"isFirst"];
    [aCoder encodeObject:self.businessAry forKey:@"businessAry"];
    [aCoder encodeObject:self.visitAry forKey:@"visitAry"];  //进度
    [aCoder encodeObject:self.LevelAry forKey:@"LevelAry"];  //等级数组
    [aCoder encodeObject:self.subMarkerAry forKey:@"subMarkerAry"];
    
    [aCoder encodeObject:self.SubArray forKey:@"SubArray"];
    
    [aCoder encodeObject:self.marketDic forKey:@"marketDic"];
    
    [aCoder encodeObject:self.LevelDic forKey:@"LevelDic"];
    [aCoder encodeObject:self.VisitDic forKey:@"VisitDic"];

}

    
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        
        self.isLogin = [aDecoder decodeObjectForKey:@"isLogin"];
        self.isFirst = [aDecoder decodeObjectForKey:@"isFirst"];
        self.businessAry = [aDecoder decodeObjectForKey:@"businessAry"];
        self.visitAry = [aDecoder decodeObjectForKey:@"visitAry"];  //进度
        self.LevelAry = [aDecoder decodeObjectForKey:@"LevelAry"];
        self.subMarkerAry = [aDecoder decodeObjectForKey:@"subMarkerAry"];
        
        self.SubArray = [aDecoder decodeObjectForKey:@"SubArray"];
        
        self.marketDic = [aDecoder decodeObjectForKey:@"marketDic"];
        
        self.LevelDic = [aDecoder decodeObjectForKey:@"LevelDic"];
        self.VisitDic = [aDecoder decodeObjectForKey:@"VisitDic"];

    }
    return self;
}

@end




