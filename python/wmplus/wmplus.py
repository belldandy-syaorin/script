import os
import sys
import ctypes
from ctypes import wintypes
import win32con
from win32api import GetCursorPos
from win32api import GetSystemMetrics
import win32gui

byref = ctypes.byref
user32 = ctypes.windll.user32
size0_default = [800 , 600];
size0_big = [1024 , 768];
size0_large = [1280 , 960];
size0_mode = 0
size1_default = [720 , 405];
size1_big = [1280 , 720];
size1_large = [1440 , 810];
size1_mode = 0
smartsize_default = [2 , 1];
smartsize_big = [3 , 2];
smartsize_large = [5 , 4];
smartsize_mode = 0
hsmartsize_default = [2 , 1];
hsmartsize_big = [3 , 2];
hsmartsize_large = [5 , 4];
hsmartsize_mode = 0;
vsmartsize_default = [2 , 1];
vsmartsize_big = [3 , 2];
vsmartsize_large = [5 , 4];
vsmartsize_mode = 0;
taskbar = 1
taskbarsize = 30

HOTKEYS = {
    1 : (win32con.VK_F3, win32con.MOD_WIN),
    2 : (win32con.VK_F4, win32con.MOD_WIN),
    3 : (win32con.VK_F2, win32con.MOD_WIN),
    4 : (win32con.VK_F7, win32con.MOD_WIN),
    5 : (win32con.VK_F8, win32con.MOD_WIN),
    6 : (win32con.VK_F11, win32con.MOD_WIN),
    7 : (win32con.VK_F12, win32con.MOD_WIN),
    8 : (0xC0, win32con.MOD_WIN)
}

def getargument():
    global resolution_w , resolution_h , hwnd , win_rect , win_rect_x , win_rect_y , win_rect_w , win_rect_h
    global center_x , center_y , smart_x , smart_y , wincenter
    global smartsize_defaultw , smartsize_defaulth , smartsize_bigw , smartsize_bigh , smartsize_largew , smartsize_largeh
    global hsmartsize_defaulth , hsmartsize_bigh , hsmartsize_largeh
    global vsmartsize_defaultw , vsmartsize_bigw , vsmartsize_largew
    global taskbar
    resolution_w = GetSystemMetrics(0)
    if taskbar == 1:
        resolution_h = GetSystemMetrics(1) - taskbarsize
    else:
        resolution_h = GetSystemMetrics(1)
    hwnd = win32gui.GetForegroundWindow()
    win_rect = win32gui.GetWindowRect(hwnd)
    win_rect_x = win_rect[0]
    win_rect_y = win_rect[1]
    win_rect_w = win_rect[2] - win_rect_x
    win_rect_h = win_rect[3] - win_rect_y
    center_x = (resolution_w - win_rect_w) / 2
    center_y = (resolution_h - win_rect_h) / 2
    smart_x = [resolution_w / 3 , resolution_w / 3 * 2 , resolution_w , resolution_w - win_rect_w]
    smart_y = [resolution_h / 3 , resolution_h / 3 * 2 , resolution_h , resolution_h - win_rect_h]
    wincenter = GetCursorPos()
    smartsize_defaultw = resolution_w / smartsize_default[0] * smartsize_default[1]
    smartsize_defaulth = resolution_h / smartsize_default[0] * smartsize_default[1]
    smartsize_bigw = resolution_w / smartsize_big[0] * smartsize_big[1]
    smartsize_bigh = resolution_h / smartsize_big[0] * smartsize_big[1]
    smartsize_largew = resolution_w / smartsize_large[0] * smartsize_large[1]
    smartsize_largeh = resolution_h / smartsize_large[0] * smartsize_large[1]
    hsmartsize_defaulth = resolution_h / hsmartsize_default[0] * hsmartsize_default[1]
    hsmartsize_bigh = resolution_h / hsmartsize_big[0] * hsmartsize_big[1]
    hsmartsize_largeh = resolution_h / hsmartsize_large[0] * hsmartsize_large[1]
    vsmartsize_defaultw = resolution_w / vsmartsize_default[0] * vsmartsize_default[1]
    vsmartsize_bigw = resolution_w / vsmartsize_big[0] * vsmartsize_big[1]
    vsmartsize_largew = resolution_w / vsmartsize_large[0] * vsmartsize_large[1]

def win_pos(x,y):
        win32gui.SetWindowPos(hwnd, 0, x, y, 0, 0, 0x0001 + 0x0004)

def win_size(x,y):
    a = (resolution_w - x) / 2
    b = (resolution_h - y) / 2
    win32gui.SetWindowPos(hwnd, 0, a, b, x, y, 0x0004)

class win_move:
    def position1(self):
        win_pos(0,smart_y[3])
    def position4(self):
        win_pos(0,center_y)
    def position7(self):
        win_pos(0,0)
    def position2(self):
        win_pos(center_x,smart_y[3])
    def position5(self):
        win_pos(center_x,center_y)
    def position8(self):
        win_pos(center_x,0)
    def position3(self):
        win_pos(smart_x[3],smart_y[3])
    def position6(self):
        win_pos(smart_x[3],center_y)
    def position9(self):
        win_pos(smart_x[3],0)

wm = win_move()

def size0():
    getargument()
    global size0_mode
    if size0_mode == 0:
        win_size(size0_default[0] , size0_default[1])
        size0_mode = 1
    elif size0_mode == 1:
        win_size(size0_big[0] , size0_big[1])
        size0_mode = 2
    elif size0_mode == 2:
        win_size(size0_large[0] , size0_large[1])
        size0_mode = 0

def size1():
    getargument()
    global size1_mode
    if size1_mode == 0:
        win_size(size1_default[0] , size1_default[1])
        size1_mode = 1
    elif size1_mode == 1:
        win_size(size1_big[0] , size1_big[1])
        size1_mode = 2
    elif size1_mode == 2:
        win_size(size1_large[0] , size1_large[1])
        size1_mode = 0

def smartsize():
    getargument()
    global smartsize_mode
    if smartsize_mode == 0:
        win_size(smartsize_defaultw , smartsize_defaulth)
        smartsize_mode = 1
    elif smartsize_mode == 1:
        win_size(smartsize_bigw , smartsize_bigh)
        smartsize_mode = 2
    elif smartsize_mode == 2:
        win_size(smartsize_largew , smartsize_largeh)
        smartsize_mode = 0

def hsmartsize():
    getargument()
    global hsmartsize_mode
    if hsmartsize_mode == 0:
        win_size(resolution_w , hsmartsize_defaulth)
        hsmartsize_mode = 1
    elif hsmartsize_mode == 1:
        win_size(resolution_w , hsmartsize_bigh)
        hsmartsize_mode = 2
    elif hsmartsize_mode == 2:
        win_size(resolution_w , hsmartsize_largeh)
        hsmartsize_mode = 0

def vsmartsize():
    getargument()
    global vsmartsize_mode
    if vsmartsize_mode == 0:
        win_size(vsmartsize_defaultw , resolution_h)
        vsmartsize_mode = 1
    elif vsmartsize_mode == 1:
        win_size(vsmartsize_bigw , resolution_h)
        vsmartsize_mode = 2
    elif vsmartsize_mode == 2:
        win_size(vsmartsize_largew , resolution_h)
        vsmartsize_mode = 0

def smartposition():
    getargument()
    if wincenter[0] >= 0 and wincenter[0] <= smart_x[0]:
        if wincenter[1] <= smart_y[0]:
            wm.position7()
        elif wincenter[1] >= smart_y[0] and wincenter[1] <= smart_y[1]:
            wm.position4()
        elif wincenter[1] >= smart_y[1] and wincenter[1] <= smart_y[2]:
            wm.position1()
    elif wincenter[0] >= smart_x[0] and wincenter[0] <= smart_x[1]:
        if wincenter[1] <= smart_y[0]:
            wm.position8()
        elif wincenter[1] >= smart_y[0] and wincenter[1] <= smart_y[1]:
            wm.position5()
        elif wincenter[1] >= smart_y[1] and wincenter[1] <= smart_y[2]:
            wm.position2()
    elif wincenter[0] >= smart_x[1] and wincenter[0] <= smart_x[2]:
        if wincenter[1] <= smart_y[0]:
            wm.position9()
        elif wincenter[1] >= smart_y[0] and wincenter[1] <= smart_y[1]:
            wm.position6()
        elif wincenter[1] >= smart_y[1] and wincenter[1] <= smart_y[2]:
            wm.position3()

def taskbar_mode():
    global taskbar
    if taskbar == 1:
        taskbar = 0
    elif taskbar == 0:
        taskbar = 1

def exit():
    user32.PostQuitMessage (0)

HOTKEY_ACTIONS = {
    1 : size0,
    2 : size1,
    3 : smartsize,
    4 : hsmartsize,
    5 : vsmartsize,
    6 : taskbar_mode,
    7 : exit,
    8 : smartposition
}

for id, (vk, modifiers) in HOTKEYS.items ():
    print "Registering id", id, "for key", vk
    if not user32.RegisterHotKey (None, id, modifiers, vk):
        print "Unable to register id", id

try:
    msg = wintypes.MSG ()
    while user32.GetMessageA (byref (msg), None, 0, 0) != 0:
        if msg.message == win32con.WM_HOTKEY:
            action_to_take = HOTKEY_ACTIONS.get (msg.wParam)
            if action_to_take:
                action_to_take ()

        user32.TranslateMessage (byref (msg))
        user32.DispatchMessageA (byref (msg))

finally:
    for id in HOTKEYS.keys ():
        user32.UnregisterHotKey (None, id)
