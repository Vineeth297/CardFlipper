using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class Wheel : MonoBehaviour
{
    // Start is called before the first frame update

    private Touch touch;
    private Vector2 touchPosition;
    private Quaternion rotationY;
    public float speedModifier;

    void Start()
    {
        speedModifier = 0.1f;
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.touchCount > 0)
        {
            touch = Input.GetTouch(0);

            if (touch.phase == UnityEngine.TouchPhase.Moved)
            {

                //transform.position = new Vector3(
                //    transform.position.x + touch.deltaPosition.x * speedModifier,
                //    transform.position.y,
                //    transform.position.z + touch.deltaPosition.y * speedModifier);

                rotationY = Quaternion.Euler(
                    0f,0f,
                    touch.deltaPosition.x * speedModifier);
                transform.rotation = rotationY * transform.rotation;
            }
        }
    }
}
