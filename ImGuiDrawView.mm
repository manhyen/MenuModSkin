
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

    static int SettingsTab = 1;

    
        
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
    ImGui::PushStyleVar(ImGuiStyleVar_WindowBorderSize, 2.0f);
        ImGui::Begin("", &MenDeal,      
        ImGuiWindowFlags_NoCollapse | ImGuiWindowFlags_NoTitleBar |
        ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoScrollbar);
           ImGui::SetWindowFontScale(1.65f);
        float originalPosY = ImGui::GetCursorPosY();
        ImGui::SetWindowFontScale(1.65f);
        ImGui::SetCursorPosY(originalPosY - 15.0f);
        ImGui::SetCursorPosY(originalPosY + 8.0f);
        const char* tieudemenuCString = [__tieudemenu UTF8String];
        ImGui::TextColored(ImVec4(1.00f, 0.85f, 0.90f, 1.0f), "%s", tieudemenuCString);
        ImGui::SameLine();

        // Button color and style
        ImVec4 buttonColor = ImVec4(1.00f, 0.85f, 0.90f, 1.0f);
        ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 20.0f);
        ImGui::PushStyleColor(ImGuiCol_Button, buttonColor);
        ImGui::PushStyleVar(ImGuiStyleVar_FrameBorderSize, 0.0f);  // Kích thước viền của nút
        ImGui::SetWindowFontScale(1.25f);
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
        ImGui::TextColored(ImVec4(1.00f, 0.85f, 0.90f, 1.0f), "%s", banquyenCString);

        
ImGui::SetCursorPosY(originalPosY);
  ImGui::SetCursorPosY(originalPosY + 10.0f);
ImVec4 buttonColor1 = ImColor(0x18, 0x18, 0x18);
ImVec4 borderColor1 = ImColor(0x76, 0x76, 0x78);
ImGui::PushStyleColor(ImGuiCol_Button, buttonColor1);
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
ImGui::PopStyleColor(2); // Phục hồi 2 giá trị màu sắc (Button, Border)
ImGui::SameLine();
ImVec4 baseButtonColor = ImColor(85, 37, 180);          // Màu nền nút đỏ
ImVec4 buttonHoveredColor = ImColor(85, 37, 180);  // Màu nền nút khi hover (đỏ nhạt hơn)
ImVec4 buttonActiveColor = ImColor(85, 37, 180);       // Màu nền nút khi nhấn (đỏ đậm hơn)
ImVec4 borderColor = ImColor(185, 162, 230);             // Màu viền đỏ

// Thay đổi màu sắc cho nút
ImGui::PushStyleColor(ImGuiCol_Button, baseButtonColor);  // Màu nền nút
ImGui::PushStyleColor(ImGuiCol_ButtonHovered, buttonHoveredColor);  // Màu nền nút khi hover
ImGui::PushStyleColor(ImGuiCol_ButtonActive, buttonActiveColor);    // Màu nền nút khi nhấn

// Thay đổi màu viền và các thuộc tính kiểu dáng của nút
ImGui::PushStyleColor(ImGuiCol_Border, borderColor);  // Màu viền nút
ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 20.0f);  // Làm tròn các góc của nút
ImGui::PushStyleVar(ImGuiStyleVar_FrameBorderSize, 3.0f);  // Kích thước viền của nút
ImGui::SetCursorPosY(originalPosY + 110.0f);
NSString *xoaModSkin_nsstr = __xoaModSkin; // Giả sử __xoaModSkin là NSString*
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
// Khôi phục các giá trị màu và viền trước đó
ImGui::PopStyleVar(2);
ImGui::PopStyleColor(4);
ImVec4 pinkText = ImVec4(1.00f, 0.85f, 0.90f, 1.0f);
ImVec4 pinkBg   = ImVec4(1.00f, 0.85f, 0.90f, 0.30f);

ImGui::PushStyleColor(ImGuiCol_Button, pinkBg);
ImGui::PushStyleColor(ImGuiCol_Text, pinkText);
ImGui::PushStyleColor(ImGuiCol_ButtonHovered, ImVec4(1.00f, 0.85f, 0.90f, 0.55f));
ImGui::PushStyleColor(ImGuiCol_ButtonActive, ImVec4(1.00f, 0.75f, 0.88f, 1.0f));

ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 20.0f);
ImGui::PushStyleVar(ImGuiStyleVar_FrameBorderSize, 0.0f);

ImGui::SetCursorPosY(originalPosY + 156.0f);
ImGui::SetCursorPosX(ImGui::GetCursorPosX() + spacing); // Update cursor position

NSString *dangXuatAccNhanh_nsstr = __dangXuatAccNhanh; // Giả sử __dangXuatAccNhanh là NSString*
const char* dangXuatAccNhanh_cstr = [dangXuatAccNhanh_nsstr UTF8String];
if (ImGui::Button(dangXuatAccNhanh_cstr, ImVec2(290, 42))) {
    [self Guest];
}

// Restore the original style values
ImGui::PopStyleVar(2); // Pop 2 style variables (FrameRounding, FrameBorderSize)
ImGui::PopStyleColor(4); // Pop 4 style colors (Button, ButtonHovered, Border, Text)
           ImGui::SetWindowFontScale(0.6f);
           ImGui::SetCursorPosX(ImGui::GetCursorPosX() + spacing);
ImGui::TextColored(ImVec4(1.00f, 0.85f, 0.90f, 1.0f), "_____________________________________________________________________");
ImGui::SetCursorPosX(ImGui::GetCursorPosX() + spacing); // Cập nhật vị trí con trỏ
   ImGui::SetWindowFontScale(0.9f);
    ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 15.0f);
         ImGui::PushStyleColor(ImGuiCol_Button, ImVec4(1.00f, 0.85f, 0.90f, 0.90f));
ImGui::PushStyleColor(ImGuiCol_ButtonHovered, ImVec4(1.00f, 0.85f, 0.90f, 1.00f));
ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(255 / 255.0f, 255 / 255.0f, 255 / 255.0f, 1.0f));
ImGui::PushStyleColor(ImGuiCol_ButtonActive, ImVec4(1.00f, 0.75f, 0.88f, 1.0f));
ImGui::PushStyleVar(ImGuiStyleVar_FrameBorderSize, 0.0f);  // Kích thước viền của nút
const char* banquyen1CString = [__banquyen1 UTF8String];
ImGui::TextColored(ImVec4(1.00f, 0.85f, 0.90f, 1.0f), "%s", banquyenCString);     
ImGui::PopStyleVar(2);
ImGui::PopStyleColor(3);
            ImGui::End();
        }
ImGuiStyle& style = ImGui::GetStyle();

style.Colors[ImGuiCol_WindowBg] = ImColor(10, 10, 10, 200);
style.Colors[ImGuiCol_ChildBg]  = ImVec4(0.10f, 0.10f, 0.10f, 0.70f);
style.Colors[ImGuiCol_PopupBg]  = ImVec4(0.12f, 0.12f, 0.12f, 0.90f);

// ===== TEXT =====
style.Colors[ImGuiCol_Text] = ImVec4(1.00f, 0.85f, 0.90f, 1.0f);         // Hồng pastel
style.Colors[ImGuiCol_TextDisabled] = ImVec4(0.60f, 0.45f, 0.50f, 1.0f); // Hồng nhạt hơn

// ===== BORDER =====
style.Colors[ImGuiCol_Border] = ImVec4(1.00f, 0.85f, 0.90f, 0.9f);

// ===== BUTTON =====
style.Colors[ImGuiCol_Button]        = ImVec4(1.00f, 0.85f, 0.90f, 0.35f);
style.Colors[ImGuiCol_ButtonHovered] = ImVec4(1.00f, 0.85f, 0.90f, 0.55f);
style.Colors[ImGuiCol_ButtonActive]  = ImVec4(1.00f, 0.75f, 0.88f, 0.85f);

// ===== SLIDER / GRAB =====
style.Colors[ImGuiCol_SliderGrab]        = ImVec4(1.00f, 0.85f, 0.90f, 1.0f);
style.Colors[ImGuiCol_SliderGrabActive]  = ImVec4(1.00f, 0.75f, 0.88f, 1.0f);

// ===== FRAME (input, combo, list box) =====
style.Colors[ImGuiCol_FrameBg]        = ImVec4(0.15f, 0.15f, 0.15f, 0.8f);
style.Colors[ImGuiCol_FrameBgHovered] = ImVec4(1.00f, 0.85f, 0.90f, 0.25f);
style.Colors[ImGuiCol_FrameBgActive]  = ImVec4(1.00f, 0.75f, 0.88f, 0.40f);

// ===== TAB =====
style.Colors[ImGuiCol_Tab]               = ImVec4(1.00f, 0.85f, 0.90f, 0.30f);
style.Colors[ImGuiCol_TabHovered]        = ImVec4(1.00f, 0.85f, 0.90f, 0.75f);
style.Colors[ImGuiCol_TabActive]         = ImVec4(1.00f, 0.75f, 0.88f, 0.90f);
style.Colors[ImGuiCol_TabUnfocused]      = ImVec4(0.30f, 0.30f, 0.30f, 0.40f);
style.Colors[ImGuiCol_TabUnfocusedActive]= ImVec4(1.00f, 0.75f, 0.88f, 0.50f);

// ===== SCROLLBAR =====
style.Colors[ImGuiCol_ScrollbarBg] = ImVec4(0.10f, 0.10f, 0.10f, 0.50f);
style.Colors[ImGuiCol_ScrollbarGrab]       = ImVec4(1.00f, 0.85f, 0.90f, 0.40f);
style.Colors[ImGuiCol_ScrollbarGrabHovered]= ImVec4(1.00f, 0.85f, 0.90f, 0.60f);
style.Colors[ImGuiCol_ScrollbarGrabActive] = ImVec4(1.00f, 0.75f, 0.88f, 0.85f);

// ===== CHECKBOX, RADIO =====
style.Colors[ImGuiCol_CheckMark] = ImVec4(1.00f, 0.85f, 0.90f, 1.0f);

// ===== TITLE BAR =====
style.Colors[ImGuiCol_TitleBg]        = ImVec4(0.10f, 0.10f, 0.10f, 0.95f);
style.Colors[ImGuiCol_TitleBgActive]  = ImVec4(1.00f, 0.75f, 0.88f, 0.60f);
style.Colors[ImGuiCol_TitleBgCollapsed] = ImVec4(0.10f, 0.10f, 0.10f, 0.50f);

// ===== SEPARATOR =====
style.Colors[ImGuiCol_Separator]        = ImVec4(1.00f, 0.85f, 0.90f, 0.60f);
style.Colors[ImGuiCol_SeparatorHovered] = ImVec4(1.00f, 0.85f, 0.90f, 0.85f);
style.Colors[ImGuiCol_SeparatorActive]  = ImVec4(1.00f, 0.75f, 0.88f, 1.0f);

style.FrameRounding = 8.0f;
style.PopupRounding = 6.0f;
style.ScrollbarRounding = 10.0f;
style.TabRounding = 6.0f;
style.WindowRounding = 12.0f;
style.GrabMinSize = 12.0f;
style.ScrollbarSize = 18.0f;
style.TabBorderSize = 0.0f;
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