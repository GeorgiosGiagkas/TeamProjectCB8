 // Create new wheel object specifying the parameters at creation time.
 var theWheel = new Winwheel({
    'numSegments'  : 8,     // Specify number of segments.
    'outerRadius'  : 212,   // Set outer radius so wheel fits inside the background.
    'textFontSize' : 28,    // Set font size as desired.
    'segments'     :        // Define segments including colour and text.
    [
       {'fillStyle' : '#eae56f', 'text' : '10  Pts'},
       {'fillStyle' : '#89f26e', 'text' : '20  Pts'},
       {'fillStyle' : '#7de6ef', 'text' : '30  Pts'},
       {'fillStyle' : '#e7706f', 'text' : '40  Pts'},
       {'fillStyle' : '#eae56f', 'text' : '50  Pts'},
       {'fillStyle' : '#89f26e', 'text' : '60  Pts'},
       {'fillStyle' : '#7de6ef', 'text' : '70  Pts'},
       {'fillStyle' : '#e7706f', 'text' : '80  Pts'}
    ],
    'animation' :           // Specify the animation to use.
    {
        'type'     : 'spinToStop',
        'duration' : 3,     // Duration in seconds.
        'spins'    : 8,     // Number of complete spins.
        'callbackFinished' : alertPrize
    }
});

// Vars used by the code in this page to do power controls.
var wheelPower    = 0;
var wheelSpinning = false;

// -------------------------------------------------------
// Function to handle the onClick on the power buttons.
// -------------------------------------------------------
function powerSelected(powerLevel)
{

    // Ensure that power can't be changed while wheel is spinning.
    if (wheelSpinning == false)
    {


        // Set wheelPower var used when spin button is clicked.
        wheelPower = powerLevel;

        // Light up the spin button by changing it's source image and adding a clickable class to it.
    
    }
}

// -------------------------------------------------------
// Click handler for spin button.
// -------------------------------------------------------
function startSpin()
{
    //power level 1
    powerSelected(1);


    // Ensure that spinning can't be clicked again while already running.
    if (wheelSpinning == false)
    {
        // Based on the power level selected adjust the number of spins for the wheel, the more times is has
        // to rotate with the duration of the animation the quicker the wheel spins.
        if (wheelPower == 1)
        {
            theWheel.animation.spins = 3;
            
        }
        else if (wheelPower == 2)
        {
            theWheel.animation.spins = 8;
        }
        else if (wheelPower == 3)
        {
            theWheel.animation.spins = 15;
        }

        // Begin the spin animation by calling startAnimation on the wheel object.
        theWheel.startAnimation();

        // Set to true so that power can't be changed and spin button re-enabled during
        // the current animation. The user will have to reset before spinning again.
        wheelSpinning = true;
    }
}

// -------------------------------------------------------
// Function for reset button.
// -------------------------------------------------------
function resetWheel()
{
    theWheel.stopAnimation(false);  // Stop the animation, false as param so does not call callback function.
    theWheel.rotationAngle = 0;     // Re-set the wheel angle to 0 degrees.
    theWheel.draw();                // Call draw to render changes to the wheel.

    wheelSpinning = false;          // Reset to false to power buttons and spin can be clicked again.
}

// -------------------------------------------------------
// Called when the spin animation has finished by the callback feature of the wheel because I specified callback in the parameters
// note the indicated segment is passed in as a parmeter as 99% of the time you will want to know this to inform the user of their prize.
// -------------------------------------------------------
function alertPrize(indicatedSegment)
{
    // Do basic alert of the segment text. You would probably want to do something more interesting with this information.
    alert("You have won " + indicatedSegment.text);

}


