//Require standard library
#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import <Foundation/Foundation.h>
//Imgui library
#import "Esp/CaptainHook.h"
#import "Esp/ImGuiDrawView.h"
#import "IMGUI/imgui.h"
#import "IMGUI/imgui_impl_metal.h"
#import "IMGUI/zzz.h"
#import "aov.h"
#import "Esp/FTNotificationIndicator.h"
#import "mod/ModSanh.mm"
#import "mod/ModSkinDSGaming.mm"
#import "mod/Backup.mm"
#import "mod/mod.mm"
#import "mahoa.h"
#import "Icon.h"
#import "ico_font.h"
#import "Iconcpp.h"
#include <string> 

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kScale [UIScreen mainScreen].scale


@interface ImGuiDrawView () <MTKViewDelegate>
@property (nonatomic, strong) id <MTLDevice> device;
@property (nonatomic, strong) id <MTLCommandQueue> commandQueue;
@end

@implementation ImGuiDrawView



static bool MenDeal = true;


- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    _device = MTLCreateSystemDefaultDevice();
    _commandQueue = [_device newCommandQueue];

    if (!self.device) abort();

    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); 
    (void)io;
    
    io.ConfigWindowsMoveFromTitleBarOnly = true;
    io.IniFilename = NULL;
    static const ImWchar icons_ranges[] = { 0xf000, 0xf3ff, 0 };
    ImFontConfig icons_config;
    ImFontConfig CustomFont;
    CustomFont.FontDataOwnedByAtlas = false;
    icons_config.MergeMode = true;
    icons_config.PixelSnapH = true;
    icons_config.OversampleH = 7;
    icons_config.OversampleV = 7;
    NSString *FontPath = @"/System/Library/Fonts/Core/AvenirNext.ttc";
    io.Fonts->AddFontFromFileTTF(FontPath.UTF8String, 40.f,NULL,io.Fonts->GetGlyphRangesVietnamese());
    io.Fonts->AddFontFromMemoryCompressedTTF(font_awesome_data, font_awesome_size, 25.0f, &icons_config, icons_ranges);
    ImGui_ImplMetal_Init(_device);
    return self;
}

+ (void)showChange:(BOOL)open
{
    MenDeal = open;
}

- (MTKView *)mtkView
{
    return (MTKView *)self.view;
}

- (void)loadView
{

 

    CGFloat w = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width;
    CGFloat h = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height;
    self.view = [[MTKView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
}

-(void)Guest
{

[FTNotificationIndicator showNotificationWithImage:[UIImage imageNamed:@"AppIcon"]
                                           title:__name
                                         message:__notidangxuatacc];


timer(0.1){


UIAlertController *alert = [UIAlertController alertControllerWithTitle:__notidangxuatacc1 message:nil preferredStyle:UIAlertControllerStyleAlert];


UIAlertAction *huy = [UIAlertAction actionWithTitle:__notidangxuatacc2 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){

}];

UIAlertAction *tieptuc = [UIAlertAction actionWithTitle:__notidangxuatacc3 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){



[FTNotificationIndicator showNotificationWithImage:[UIImage imageNamed:@"AppIcon"]
                                              title:__name
                                         message:__notidangxuatacc4];

[[NSFileManager defaultManager]
removeItemAtPath:[NSString stringWithFormat:@"%@/Documents/beetalk_session.db",NSHomeDirectory()] error:nil];

exit(3);


}];

////-------/////

[tieptuc setValue:[UIColor redColor] forKey:@"titleTextColor"];
[alert addAction:huy];
[alert addAction:tieptuc];



    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:true completion:nil];

});

}

- (void)viewDidLoad {
    [super viewDidLoad];
    //patch anti anogs


    self.mtkView.device = self.device;
    self.mtkView.delegate = self;
    self.mtkView.clearColor = MTLClearColorMake(0, 0, 0, 0);
    self.mtkView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    self.mtkView.clipsToBounds = YES;

}



#pragma mark - Interaction

- (void)updateIOWithTouchEvent:(UIEvent *)event
{
    UITouch *anyTouch = event.allTouches.anyObject;
    CGPoint touchLocation = [anyTouch locationInView:self.view];
    ImGuiIO &io = ImGui::GetIO();
    io.MousePos = ImVec2(touchLocation.x, touchLocation.y);

    BOOL hasActiveTouch = NO;
    for (UITouch *touch in event.allTouches)
    {
        if (touch.phase != UITouchPhaseEnded && touch.phase != UITouchPhaseCancelled)
        {
            hasActiveTouch = YES;
            break;
        }
    }
    io.MouseDown[0] = hasActiveTouch;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

#pragma mark - MTKViewDelegate
#define iPhonePlus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
- (void)drawInMTKView:(MTKView*)view
{
   
    
   ImGuiIO& io = ImGui::GetIO();
    io.DisplaySize.x = view.bounds.size.width;
    io.DisplaySize.y = view.bounds.size.height;
    CGFloat framebufferScale = view.window.screen.scale ?: UIScreen.mainScreen.scale;
    if (iPhonePlus) {
        io.DisplayFramebufferScale = ImVec2(2.60, 2.60);
    }else{
        io.DisplayFramebufferScale = ImVec2(framebufferScale, framebufferScale);
    }
    io.DeltaTime = 1 / float(view.preferredFramesPerSecond ?: 120);
    
    id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];

    static int SettingsTab = 1; // Khai báo biến chỉ một lần

    
        
        if (MenDeal == true) {
            [self.view setUserInteractionEnabled:YES];
        } else if (MenDeal == false) {
            [self.view setUserInteractionEnabled:NO];
        }

        MTLRenderPassDescriptor* renderPassDescriptor = view.currentRenderPassDescriptor;
        if (renderPassDescriptor != nil)
        {
            id <MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
            [renderEncoder pushDebugGroup:@"ImGui Jane"];

            ImGui_ImplMetal_NewFrame(renderPassDescriptor);
            ImGui::NewFrame();
            
            ImFont* font = ImGui::GetFont();
            font->Scale = 19.f / font->FontSize;
            
            CGFloat x = (([UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width) - 360) / 2;
            CGFloat y = (([UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height) - 300) / 2;
            
            ImGui::SetNextWindowPos(ImVec2(x, y), ImGuiCond_FirstUseEver);
            ImGui::SetNextWindowSize(ImVec2(335, 270), ImGuiCond_FirstUseEver);
            
            if (MenDeal == true)
            {                
             ImGui::PushStyleColor(ImGuiCol_Border, ImVec4(1.00f, 0.85f, 0.90f, 1.0f));
    ImGui::PushStyleVar(ImGuiStyleVar_WindowBorderSize, 2.0f); // Kích thước viền là 2.0f   
        ImGui::Begin("", &MenDeal,      
        ImGuiWindowFlags_NoCollapse | ImGuiWindowFlags_NoTitleBar |
        ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoScrollbar);
           ImGui::SetWindowFontScale(1.65f);
        float originalPosY = ImGui::GetCursorPosY();
        ImGui::SetWindowFontScale(1.65f);
        ImGui::SetCursorPosY(originalPosY - 15.0f);
        ImGui::SetCursorPosY(originalPosY + 8.0f);
        const char* tieudemenuCString = [__tieudemenu UTF8String];
        ImGui::TextColored(ImColor(224, 17, 95), "%s", tieudemenuCString);
        ImGui::SameLine();

        // Button color and style
        ImVec4 buttonColor = ImColor(170, 170, 170); // Light red
        ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 20.0f);
        ImGui::PushStyleColor(ImGuiCol_Button, buttonColor);
        ImGui::PushStyleVar(ImGuiStyleVar_FrameBorderSize, 0.0f);  // Kích thước viền của nút
        ImGui::SetWindowFontScale(1.25f);
        ImGui::SetCursorPosY(originalPosY + 4.0f);
        ImGui::SetCursorPosY(originalPosY + 12.0f);
        
        const char* exitmenuCString = [__exitmenu UTF8String];
        // Nối chuỗi để tạo nhãn cho nút
        std::string buttonLabel = std::string(ICON_FA_POWER_OFF) + " " + exitmenuCString;
        // Sử dụng chuỗi đã nối để tạo nút
        if (ImGui::Button(buttonLabel.c_str(), ImVec2(90, 28))) {
            MenDeal = false;
        }

        ImGui::PopStyleVar(2);
        ImGui::PopStyleColor();

        // Text with adjusted position
        ImGui::SetWindowFontScale(0.6f);
        
        ImGui::SetCursorPosY(originalPosY - 2.0f);
        ImGui::SetCursorPosY(originalPosY + 31.0f);
        // Sử dụng __banquyen thay vì banquyen
        const char* banquyenCString = [__banquyen UTF8String];
        ImVec2 pos = ImGui::GetCursorScreenPos();
ImDrawList* draw_list = ImGui::GetWindowDrawList();

const char* text = banquyenCString;

// Lấy thời gian để tạo hiệu ứng nhấp nháy
float t = (float)ImGui::GetTime();
float glow = (sinf(t * 3.0f) * 0.5f + 0.5f) * 150;  // dao động từ 0 → 150

// Vẽ lớp phát sáng động (glow layer)
for (int i = -3; i <= 3; i++) {
    for (int j = -3; j <= 3; j++) {
        if (i == 0 && j == 0) continue;
        draw_list->AddText(ImVec2(pos.x + i, pos.y + j),
                           IM_COL32(255, 20, 147, (int)glow),  // Hồng neon (DeepPink)
                           text);
    }
}

// Vẽ chữ chính (sáng rõ ở giữa)
draw_list->AddText(pos, IM_COL32(255, 20, 147, 255), text);

// Giữ layout ImGui không bị lệch
ImGui::Dummy(ImVec2(ImGui::CalcTextSize(text).x, ImGui::CalcTextSize(text).y));

        
ImGui::SetCursorPosY(originalPosY);
  ImGui::SetCursorPosY(originalPosY + 10.0f);
ImVec4 buttonColor1 = ImColor(0x18, 0x18, 0x18); // màu bình thường (đen)
ImVec4 borderColor1 = ImColor(0x76, 0x76, 0x78);

ImGui::PushStyleColor(ImGuiCol_Button, buttonColor1);
ImGui::PushStyleColor(ImGuiCol_ButtonHovered, ImVec4(1.00f, 0.65f, 0.75f, 1.0f)); //màu hover hồng
ImGui::PushStyleColor(ImGuiCol_Border, borderColor1);

ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 20.0f);
ImGui::PushStyleVar(ImGuiStyleVar_FrameBorderSize, 3.0f);

float spacing = 15.0f; // Khoảng cách giữa các nút
ImGui::SetWindowFontScale(0.9f);
// Vẽ các nút
ImGui::SetCursorPosY(originalPosY + 50.0f);
ImGui::SetCursorPosX(ImGui::GetCursorPosX() + spacing); // Cập nhật vị trí con trỏ

NSString *modqualink_nsstr = __modqualink; // Giả sử __modqualink là NSString*
std::string modqualink_str = [modqualink_nsstr UTF8String];
if (ImGui::Button((std::string(ICON_FA_LINK) + " " + modqualink_str).c_str(), ImVec2(140, 53))) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Thực thi backup trong thread mới
        [Backup createBackup];
        
        // Sau khi backup hoàn thành, quay lại thread chính để thực thi mod
        dispatch_async(dispatch_get_main_queue(), ^{
            [Mod ActiveMod];
        });
    });
}



ImGui::SameLine();
NSString *modquafile_nsstr = __modquafile; // Giả sử __modquafile là NSString*
std::string modquafile_str = [modquafile_nsstr UTF8String];
if (ImGui::Button((std::string(ICON_FA_FOLDER_OPEN) + " " + modquafile_str).c_str(), ImVec2(140, 53))) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:__modquafile1
                                                                   message:__modquafile2
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *clear = [UIAlertAction actionWithTitle:__modquafile3 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [Backup createBackup];
            dispatch_async(dispatch_get_main_queue(), ^{
            [ModSkinDSGM ActiveModDSGM]; // Gọi phương thức Objective-C
            });
        });
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:__modquafile4 style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [alert addAction:clear];
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    [viewController presentViewController:alert animated:YES completion:nil];
}
ImGui::SetCursorPosY(originalPosY + 110.0f);
ImGui::SetCursorPosX(ImGui::GetCursorPosX() + spacing); // Cập nhật vị trí con trỏ
NSString *modsanh_nsstr = __modsanh; // Giả sử __modsanh là NSString*
const char* modsanh_cstr = [modsanh_nsstr UTF8String];
if (ImGui::Button(modsanh_cstr, ImVec2(140, 38))) {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:__modsanh1
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *modAction = [UIAlertAction actionWithTitle:__modsanh2 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [ModSanh ActiveModSanh]; // Gọi phương thức Objective-C
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:__modsanh3 style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:cancelAction];
    [alert addAction:modAction];
    
    // Đảm bảo rằng viewController không phải là nil
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    if (viewController) {
        [viewController presentViewController:alert animated:YES completion:nil];
    } else {
        NSLog(@"Root view controller is nil. Cannot present alert.");
    }
}
ImGui::PopStyleVar(2); // Phục hồi 2 giá trị kiểu dáng (FrameRounding, FrameBorderSize)
ImGui::PopStyleColor(3); // Phục hồi 2 giá trị màu sắc (Button, Border)
ImGui::SameLine();
ImVec4 baseButtonColor = ImColor(85, 37, 180);          // Màu nền nút đỏ
ImVec4 buttonHoveredColor = ImColor(85, 37, 180);  // Màu nền nút khi hover (đỏ nhạt hơn)
ImVec4 buttonActiveColor = ImColor(85, 37, 180);       // Màu nền nút khi nhấn (đỏ đậm hơn)
ImVec4 borderColor = ImColor(185, 162, 230);             // Màu viền đỏ

// Nút "Xóa Mod Skin"
ImGui::PushStyleColor(ImGuiCol_Button, ImColor(135, 206, 250));       // màu chính SkyBlue
ImGui::PushStyleColor(ImGuiCol_ButtonHovered, ImColor(160, 220, 255)); // hover sáng hơn
ImGui::PushStyleColor(ImGuiCol_ButtonActive, ImColor(100, 180, 230));  // nhấn đậm hơn
ImGui::PushStyleColor(ImGuiCol_Border, ImColor(180, 220, 250));        // viền xanh nhạt
ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 20.0f);
ImGui::PushStyleVar(ImGuiStyleVar_FrameBorderSize, 2.0f);

NSString *xoaModSkin_nsstr = __xoaModSkin;
const char* xoaModSkin_cstr = [xoaModSkin_nsstr UTF8String];
if (ImGui::Button(xoaModSkin_cstr, ImVec2(140, 38))) {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:__xoaModSkin1
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *clear = [UIAlertAction actionWithTitle:__xoaModSkin2 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [Backup deleteBackup];
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:__xoaModSkin3 style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [alert addAction:clear];
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    [viewController presentViewController:alert animated:YES completion:nil];
}

ImGui::PopStyleVar(2);
ImGui::PopStyleColor(4);
ImVec4 purpleText = ImVec4(85.0f / 255.0f, 37.0f / 255.0f, 180.0f / 255.0f, 1.0f);  // #5525B4
ImVec4 purpleBackground = ImVec4(185.0f / 255.0f, 162.0f / 255.0f, 230.0f / 255.0f, 1.0f);  // #B9A2E6

// Đặt màu nền và màu chữ
ImGui::PushStyleColor(ImGuiCol_Button, purpleBackground);        // Nền nút
ImGui::PushStyleColor(ImGuiCol_Text, purpleText);                // Màu chữ
ImGui::PushStyleColor(ImGuiCol_ButtonHovered, purpleBackground); // Nền khi hover
ImGui::PushStyleColor(ImGuiCol_ButtonActive, purpleBackground);  // Nền khi click

ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 20.0f);
ImGui::PushStyleVar(ImGuiStyleVar_FrameBorderSize, 0.0f);

ImGui::SetCursorPosY(originalPosY + 156.0f);
ImGui::SetCursorPosX(ImGui::GetCursorPosX() + spacing); // Update cursor position

//Nút "Đăng xuất acc nhanh"
ImVec4 logoutButtonColor    = ImColor(224, 17, 95);   // ruby thường (#E0115F)
ImVec4 logoutHoveredColor   = ImColor(235, 60, 120);  // ruby sáng khi hover
ImVec4 logoutActiveColor    = ImColor(200, 10, 80);   // ruby đậm khi nhấn

ImVec4 logoutBorderColor    = ImColor(255, 180, 200); // viền ruby nhạt
ImVec4 logoutBorderHovered  = ImColor(240, 100, 140); // viền ruby khi hover
ImVec4 logoutBorderActive   = ImColor(190, 0, 70);    // viền ruby khi nhấn

ImVec4 textNormal  = ImVec4(1.0f, 1.0f, 1.0f, 1.0f);   // chữ trắng
ImVec4 textHovered = ImVec4(1.0f, 0.6f, 0.8f, 1.0f);   // chữ hồng khi hover
ImVec4 textActive  = ImVec4(0.8f, 0.0f, 0.4f, 1.0f);   // chữ tím ruby khi nhấn

// Push màu nền + viền + chữ
ImGui::PushStyleColor(ImGuiCol_Button, logoutButtonColor);
ImGui::PushStyleColor(ImGuiCol_ButtonHovered, logoutHoveredColor);
ImGui::PushStyleColor(ImGuiCol_ButtonActive, logoutActiveColor);
ImGui::PushStyleColor(ImGuiCol_Border, logoutBorderColor);
ImGui::PushStyleColor(ImGuiCol_Text, textNormal);

ImGui::PushStyleVar(ImGuiStyleVar_FrameBorderSize, 2.0f); // viền dày 2px
ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 12.0f);  // bo góc 12px

//Nút
if (ImGui::Button(dangXuatAccNhanh_cstr, ImVec2(290, 42))) {
    [self Guest];
}

// Sau khi vẽ nút, đổi màu chữ + viền theo trạng thái
if (ImGui::IsItemHovered()) {
    ImGui::GetStyle().Colors[ImGuiCol_Text]   = textHovered;
    ImGui::GetStyle().Colors[ImGuiCol_Border] = logoutBorderHovered;
}
if (ImGui::IsItemActive()) {
    ImGui::GetStyle().Colors[ImGuiCol_Text]   = textActive;
    ImGui::GetStyle().Colors[ImGuiCol_Border] = logoutBorderActive;
}

// Phục hồi
ImGui::PopStyleVar(2);
ImGui::PopStyleColor(5);



           ImGui::SetWindowFontScale(0.6f);
           ImGui::SetCursorPosX(ImGui::GetCursorPosX() + spacing);
ImGui::TextColored(ImColor(85, 37, 180), "_____________________________________________________________________");
ImGui::SetCursorPosX(ImGui::GetCursorPosX() + spacing); // Cập nhật vị trí con trỏ
   ImGui::SetWindowFontScale(0.9f);
      const char* banquyen1CString = [__banquyen1 UTF8String];

// Tính chiều rộng & chiều cao text
float textWidth  = ImGui::CalcTextSize(banquyen1CString).x;
float textHeight = ImGui::GetTextLineHeight();

// Đẩy text sang phải
ImGui::SetCursorPosX(ImGui::GetWindowWidth() - textWidth - 10);

// Lấy vị trí bắt đầu
ImVec2 textPos = ImGui::GetCursorScreenPos();

// Render text dạng selectable (click mở link)
ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(224/255.0f, 17/255.0f, 95/255.0f, 1.0f)); // Ruby
if (ImGui::Selectable(banquyen1CString, false, 0, ImVec2(textWidth, textHeight))) {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://beacons.ai/yenv2"]];
}
ImGui::PopStyleColor();

// Nếu hover → vẽ gạch chân ruby
if (ImGui::IsItemHovered()) {
    ImGui::GetWindowDrawList()->AddLine(
        ImVec2(textPos.x, textPos.y + textHeight - 2),
        ImVec2(textPos.x + textWidth, textPos.y + textHeight - 2),
        IM_COL32(224, 17, 95, 255), 1.5f
    );
} 

            ImGui::End();
        }
ImGuiStyle& style = ImGui::GetStyle();

// Thiết lập giao diện người dùng trong suốt
style.Colors[ImGuiCol_WindowBg] = ImColor(10, 10, 10, 255);  // Màu đen nhạt với độ trong suốt không đổi
style.Colors[ImGuiCol_WindowBg].w = 5.f;  // Đặt mức độ đục của nền cửa sổ thành 0 (suốt)

// Thiết lập bo tròn
style.FrameRounding = 1.0f;
style.GrabMinSize = 12.0f;
style.PopupRounding = 2.0f;
style.ScrollbarRounding = 13.0f;
style.ScrollbarSize = 20.0f;
style.TabBorderSize = 0.1f;
style.TabRounding = 6.0f;
style.WindowRounding = 15.0f;
style.Alpha = 1.0f; 
style.WindowTitleAlign = ImVec2(0.5f, 0.5f);


            ImGui::Render();
            ImDrawData* draw_data = ImGui::GetDrawData();
            ImGui_ImplMetal_RenderDrawData(draw_data, commandBuffer, renderEncoder);
          
            [renderEncoder popDebugGroup];
            [renderEncoder endEncoding];

            [commandBuffer presentDrawable:view.currentDrawable];
        }

        [commandBuffer commit];
}

- (void)mtkView:(MTKView*)view drawableSizeWillChange:(CGSize)size
{
    
}

@end