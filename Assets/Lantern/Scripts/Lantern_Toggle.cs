using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Lantern_Toggle : MonoBehaviour {

	public GameObject toggledObject;
	public GameObject meshToggleOn;
	public GameObject meshToggleOff;
	private int toggle = 1;
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {

		if (Input.GetKeyDown (KeyCode.L)) {
			toggle = 1 - toggle;

		}
		if (toggle==1)
		{
			toggledObject.SetActive(true);
			meshToggleOn.SetActive(true);
			meshToggleOff.SetActive(false);
		
		}
		if (toggle==0)
		{
			toggledObject.SetActive(false);
			meshToggleOn.SetActive(false);
			meshToggleOff.SetActive(true);

		}
	}
}
