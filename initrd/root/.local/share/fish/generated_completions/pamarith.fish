# pamarith
# Autogenerated from man page /usr/share/man/man1/pamarith.1.gz
complete -c pamarith -o add -d 'Adds the two values.   If the result is larger than maxval, it is clipped'
complete -c pamarith -o subtract -d 'Subtracts a value in the right input image from a value in the left input ima…'
complete -c pamarith -o minimum -d 'Chooses the smaller value of the two'
complete -c pamarith -o maximum -d 'Chooses the larger value of the two'
complete -c pamarith -o difference -d 'Calculates the absolute value of the difference'
complete -c pamarith -o multiply -d 'Does an ordinary arithmetic multiplication, but tends to produce nonobvious r…'
complete -c pamarith -o divide -d 'Divides a value in the left input image by the value in the right input image'
complete -c pamarith -o equal -d 'Produces maxval when the values in the two images are equal and zero when the…'
complete -c pamarith -o compare -d 'Produces the value 0 when the value in the left input image is less than the …'
complete -c pamarith -o and -o nand -o or -o nor -o xor -d 'These consider the input and output images to contain bit strings; they compu…'
complete -c pamarith -o shiftleft -o shiftright -d 'These consider the left input image and output image to contain bit strings'
complete -c pamarith -o closeness -d 'This changes the meaning of -equal.   It is not valid with any other function'
complete -c pamarith -o mean
