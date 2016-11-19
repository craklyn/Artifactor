import sys
import json
import os

input = json.load(sys.stdin)['face']

for i in range(len(input)):
  height = input[i]['height'] + 40
  width = input[i]['width'] + 40
  left = input[i]['left'] - 20
  top = input[i]['top'] - 20
  
  command = "convert studentsinclass.jpg -crop " + str(width) + "x" + str(height) + "+" + \
            str(left) + "+" + str(top) + " +repage faces/faceCloseup" + str(i) + ".png"
  os.system(command)

