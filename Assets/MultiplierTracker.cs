using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MultiplierTracker : MonoBehaviour
{
    public static MultiplierTracker instance;

    public List<int> GateNumber = new List<int>();

    public List<GameObject> totalGates = new List<GameObject>();
    
    void Awake()
    {
        instance = this;
        for (int i = 0; i < totalGates.Count; i++)
        {
            GateNumber.Add(i + 1 );
            totalGates[i].tag = GateNumber[i].ToString();
        }
    }    
    

    // Update is called once per frame
    void Update()
    {
        
    }
    
    
    
}
