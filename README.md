### Date created
8/08/2019

### Project Title
Rabbit Hope

### Versions
GoogleVR SDK version 1.70.0
Unity version 2019.2.0f1 Personal

### Video
Walk through:     https://youtu.be/c2rVIkvxtlg
Achievements:     https://youtu.be/cxBzFu8CcF8

### Description
This was a submission for the Udacity Virtual Reality Developer (for mobile) nanodegree.

For this project, I have built a complete project under the theme of emotion.

The task was to create an experience that makes someone feel an emotion, whether that be fear, sadness, or joy! I opted for fear and joy in the life of rabbits.

A pre-Production document is included in the repository (David_Long_pre_production_scoping_document.pdf).


### Fundamentals

1. Scale achievement - I present the viewer a rabbit's eye view. The viewer is on the same eye level as the other rabbits in the scene. Human sized objects are sized accordingly such as the lanterns, treasure chest and the high prison walls

2. Animation achievement - The Moon is animated via a script on the globe. The Treasure chest uses a script enabled Mecanim animation when the viewer gazes at the lower part of the chest. The script DetectTreasure.cs attached to the Main Camera detects if the player is looking at it. On detection is changes a bool parameter “open” from false to true which changes the state of the Chest animation from closeChest to openChest rotating the upper chest section.
The prison gate is animated in the same manner as the chest with a bool parameter called “locked”. It can be unlocked by speaking the phrase “Open Sesame” which calls the method OpenPrison() in the GameManager.cs script attached to the Player object.

3. Lighting achievement - Use a mix of baked and real-time lighting to add realistic shading to each scene.

4. Locomotion achievement - I re-purposed the locomotion system from lesson 7 “Advanced VR Scripting” in the VR Software Development module. I increased the number of waypoints and user tested them to ensure that the waypoints were positioned to ensure the viewer could move around the environment as required. The Navigation.cs script is attached to the object “Locomotion Waypoints” and the Waypoint.cs is attached to each waypoint.

5. Video Player achievement - I recorded a short video which reveals to the viewer the phrase which must be spoken to open the prison gate to free the trapped rabbit. The video is attached to a video player object called Video within the Screen object and it starts as disabled. The DetectTreasure.cs script attached to the Main Camera will set the video player object to start the video playing when the viewer looks at the lower half of the chest.


### Completeness:

1. Diegetic UI achievement - I did not provide instructions during the game opting instead to cue the viewer to the necessary action. I placed  lanterns in the action areas. I attached a crying audio source using the Resonance Audio SDK to the trapped rabbit. This can be heard faintly at the start of the game and at the prison gate it is louder to encourage the user to investigate. When the treasure chest is opened the video that plays provides a clue as to how to open the prison gate. When the prison gate is opened a message on the back wall tells the user that they have won and the rabbit who was imprisoned stops crying and cheers for his freedom.

2. AI achievement - I used the Malbers Animation Unity asset for Polyart rabbits. I deployed several waypoints both for the searching rabbit “FriendWaypoints” to follow and for the the imprisoned rabbit “Prisoner Waypoints” to follow on being freed. The Zone objects were assigned actions for the free rabbit to take while moving along the navigation navmesh which I baked on the navigation tab to give the impression that the wandering rabbit Alice was frantically searching for the imprisoned rabbit Bob.

3. Photogrammetry achievement - I initially attempted to import a model of a rabbit that I owned. The photographs I took were not lit well enough so I opted instead to use sample data set of a tree stump lit with natural light. (LINK) I used 3D Flow Zephyr to reconstruct a sparse point cloud reconstruction summary and then a more detailed dense point cloud of the tree stump. I removed grass and some other artifacts from the model before generating a textured mesh which I imported into Unity. I used the following tutorial from the makers of 3D Flow Zephyr as a reference www.youtube.com/watch?v+17UTelgZqBg

4. Speech Recognition achievement  - I integrated with IBM's Watson Speech toText and Watson's Assistant services to provide a speech to function that allowed spoken words to be validated against set intents. The viewer gives the voice command “Open Sesame” which is picked up by the Android phone microphone (the app must be given microphone permissions for this reason). The Unity application sends the spoken phrase to Watson Speech to text which converts the audio to text and returns it to the running Application on the phone. The Unity application sends the text to Watson Assistant which returns the recognized intent “Open Sesame” which unlocks the prison gate and opens the gate to free Bob the imprisoned rabbit.


### References and acknowledgments:
- IBM Watson VR Speech Sandbox https://github.com/IBM/vr-speech-sandbox-cardboard
- 3D Flow Zephyr as a reference www.youtube.com/watch?v+17UTelgZqBg
- Malbers Animations Asset  https://assetstore.unity.com/packages/3d/characters/animals/poly-art-rabbit-80359
- RRFreeLance https://assetstore.unity.com/packages/3d/props/realistic-lantern-89820
- Unluck software https://assetstore.unity.com/packages/3d/environments/sci-fi/moon-3991





