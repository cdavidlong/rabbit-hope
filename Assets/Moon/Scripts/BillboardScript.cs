using UnityEngine;
using System;


public class BillboardScript:MonoBehaviour
{
    public void LateUpdate() {
       transform.LookAt(Camera.main.transform.position, transform.up);
       //transform.Rotate( Vector3.left*-90);
    }
}