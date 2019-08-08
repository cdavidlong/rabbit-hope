using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Prison : MonoBehaviour {

    public static Prison Instance { get; private set; }

    private bool locked = true;
    

    //public GameObjext chest
    public Animator UnLocked;

    private void Awake()
    {
        if(Instance == null)

        {
            Instance = this;
        }
        else
        {
            Destroy(gameObject); // Don't allow two Prison instances
        }
    }

    public void UnLock()
    {
        locked = false;
        //Debug.Log("Now unlocked.");
    }

    public void LockStatus()
    {
        if (locked) {
            //Debug.Log("Locked.");
}
        else
        {
            //Debug.Log("Unlocked.");
        }
    }

    public void OpenPrison()
    {
        //Debug.Log("In OpenPrison locked: " + locked);
        // Add action trigger check here
        if (!locked)
        {
            //Debug.Log("OPENING THE PRISON DOOR!");
            UnLocked.SetBool("locked", false);
        }
    }

}