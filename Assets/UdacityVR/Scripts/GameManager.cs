using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;
using UnityEngine.Analytics;
using System.IO;

public class GameManager : MonoBehaviour
{

    [Header("Objects Dictionary", order = 0)]
    public List<string> _oKeys = new List<string>();
    public List<GameObject> _oValues = new List<GameObject>();
    protected Dictionary<string, GameObject> objects;

    public GameObject PrisonCage;
    public GameObject Rabbit;
    Animator GateAnimation;
    AudioSource myAudio;
    AudioSource gatechime;
    AudioSource rabbitVoice;

    protected GameObject pointerTarget;


    #region InitAndLifecycle
    //------------------------------------------------------------------------------------------------------------------
    // Initialization and Lifecycle
    //------------------------------------------------------------------------------------------------------------------

    protected virtual void Awake()
    {
        InitializeObjects();
    }

    protected virtual void Start()
    {
        GateAnimation = PrisonCage.GetComponent<Animator>();
        gatechime = PrisonCage.GetComponent<AudioSource>();
        myAudio = Rabbit.GetComponent<AudioSource>();
    }


    void InitializeObjects()
    {
        Debug.Log("Initializing Objects");
        objects = new Dictionary<string, GameObject>();

        for (var i = 0; i != Math.Min(_oKeys.Count, _oValues.Count); i++)
        {
            objects.Add(_oKeys[i], _oValues[i]);
        }

        _oValues.Clear();
    }

    #endregion

    #region Public
    //------------------------------------------------------------------------------------------------------------------
    // Public Interface Functions
    //------------------------------------------------------------------------------------------------------------------

    public virtual void OpenPrison()
    {
        Debug.Log(" *** VOICE MATCH OPEN SESAME *** ");
        GateAnimation.SetBool("locked", false);
        gatechime.enabled = true; //Play the Curioser and curioser Alice in Wonderland wav
        myAudio.Stop(); // Stop the imprisoned rabbit's crying
        myAudio.clip = Resources.Load<AudioClip>("freedom"); // Load up the Freedom wav 
        myAudio.volume = 1; //Play the freedom clip louder
        
        myAudio.Play(); // Play the freedom wav    
    }
    #endregion
}
