call("java.lang.System.gc"); 
setOption("JFileChooser", true); 
dir1 = getDirectory("Choose Folder containing images to analyze");
dir2 = getDirectory("Choose Folder in which to save measurements");
run("Set Measurements...", "mean redirect=None decimal=2");
waitForUser("Open the ROIs for the folder of images that you will analyze");
//measurement loop begins here
setBatchMode(true);
list = getFileList(dir1);
for (i=0; i<list.length; i++) {
  if (endsWith(list[i], ".tif")) {
    open(dir1 + list[i]); 
        roiManager("Deselect");
    roiManager("Multi Measure");
    selectWindow("Results");
    saveAs(".txt", dir2+list[i]);
      while (nImages>0) { 
          selectImage(nImages); 
          close(); }
    call("java.lang.System.gc"); 
  }}
  //this clears the results at the end so that you can do other analysis
     run("Clear Results");
     roiManager("Delete");
     selectWindow("Results");
     run("Close");
     selectWindow("ROI Manager");
     run("Close");
     setBatchMode(false);