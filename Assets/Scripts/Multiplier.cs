using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Multiplier : MonoBehaviour
{
    PoolManager poolManager;

    public bool isUsed;

    void Awake()
    {

    }
    
    void Start()
    {
        poolManager = PoolManager.instance;
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void OnTriggerEnter (Collider other)
    {
        if (isUsed)
        {
            return;
        }
        else if (other.CompareTag("Ball"))
        {
            BallSpawner.instance.GenerateBalls(5);
          
            other.tag = "Used";
            //isUsed = true;
        }
    }
}
