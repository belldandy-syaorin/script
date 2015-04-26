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

HOTKEYS = {
    1 : (0xC0, win32con.MOD_WIN),
    2 : (win32con.VK_F5, win32con.MOD_WIN),
    3 : (win32con.VK_F6, win32con.MOD_WIN),
    4 : (win32con.VK_F12, win32con.MOD_WIN)
}

def getargument():
    global resolution_w , resolution_h , hwnd , win_rect , win_rect_x , win_rect_y , win_rect_w , win_rect_h , center_x , center_y , smart_x , smart_y , wincenter , smartsize_big , smartsize_large , size_default , size_big , size_large
    resolution_w = GetSystemMetrics(0)
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
    smartsize_big = [resolution_w / 3 * 2 , resolution_h / 3 * 2]
    smartsize_large = [resolution_w / 5 * 4 , resolution_h / 5 * 4]
    size_default = [800 , 600]
    size_big = [1024 , 768]
    size_large = [1280 , 960]

def win_pos(x,y,z):
    win32gui.SetWindowPos(hwnd, 0, x, y, 0, 0, 0x0001 + 0x0004)

def win_size(x,y):
    a = (resolution_w - x) / 2
    b = (resolution_h - y) / 2
    win32gui.SetWindowPos(hwnd, 0, a, b, x, y, 0x0004)

class win_move:
    def position1(self):
        win_pos(0,smart_y[3],1)
    def position4(self):
        win_pos(0,center_y,4)
    def position7(self):
        win_pos(0,0,7)
    def position2(self):
        win_pos(center_x,smart_y[3],2)
    def position5(self):
        win_pos(center_x,center_y,5)
    def position8(self):
        win_pos(center_x,0,8)
    def position3(self):
        win_pos(smart_x[3],smart_y[3],3)
    def position6(self):
        win_pos(smart_x[3],center_y,6)
    def position9(self):
        win_pos(smart_x[3],0,9)

wm = win_move()

def handle_smartposition ():
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

def handle_smartsize ():
    getargument()
    if win_rect_w == smartsize_big[0] and win_rect_h == smartsize_big[1]:
        win_size(smartsize_large[0] , smartsize_large[1])
    elif win_rect_w == smartsize_large[0] and win_rect_h == smartsize_large[1]:
        win_size(smartsize_big[0] , smartsize_big[1])
    else:
        win_size(smartsize_big[0] , smartsize_big[1])

def handle_size ():
    getargument()
    if win_rect_w == size_default[0] and win_rect_h == size_default[1]:
        win_size(size_big[0] , size_big[1])
    elif win_rect_w == size_big[0] and win_rect_h == size_big[1]:
        win_size(size_large[0] , size_large[1])
    elif win_rect_w == size_large[0] and win_rect_h == size_large[1]:
        win_size(size_default[0] , size_default[1])
    else:
        win_size(size_default[0] , size_default[1])

def handle_exit ():
    user32.PostQuitMessage (0)

HOTKEY_ACTIONS = {
    1 : handle_smartposition,
    2 : handle_smartsize,
    3 : handle_size,
    4 : handle_exit
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
