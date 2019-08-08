using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Video;

public class DetectTreasure : MonoBehaviour {

    public static DetectTreasure Instance { get; private set; }

    //public GameObjext chest
    public Animator chestOpen;
    public GameObject videoPlayer;
    public GameObject audioClip;
    public int timeToStop;

    private void Start()
    {
        videoPlayer.SetActive(false);
        audioClip.SetActive(false);
    }

    void FixedUpdate()
    {
        // Bit shift the index of the layer (8) to get a bit mask
        int layerMask = 1 << 25;

        Vector3 fwd = transform.TransformDirection(Vector3.forward);
        
        // Detect if the player is looking at the chest within 2m of it
        if (Physics.Raycast(transform.position, fwd, 4, layerMask)) {
            
            // Add action trigger check here
            chestOpen.SetBool("open", true);
            
            // play treasure fanfare
            UnLock();
        }
      }

    private void UnLock()
    {
        Prison.Instance.UnLock();
        //Debug.Log("*** You unlocked the prison! ***");
        audioClip.SetActive(true);
        videoPlayer.SetActive(true);

    }
}
