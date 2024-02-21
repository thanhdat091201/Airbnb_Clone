import {useState} from 'react';
import Map, {

} from 'react-map-gl';


const MAPBOX_TOKEN ="pk.eyJ1IjoidWJlcmRhdGEiLCJhIjoiY2pwY3owbGFxMDVwNTNxcXdwMms2OWtzbiJ9.1PPVl0VLUQgqrosrI2nUhg";

const MapBox = () => {
  const [viewState, setViewState] = useState({
    latitude: 10.762622,
    longitude: 106.660172,
    zoom: 7,
    bearing: 0,
    pitch: 0
  });
  return (
    <>
      <Map
        mapboxAccessToken={MAPBOX_TOKEN}
        {...viewState}
        onMove={evt => setViewState(evt.viewState)}
        styleDiffing
        style={{width: '100%', height: '100%'}}
        mapStyle={'mapbox://styles/mapbox/streets-v9'}
      >
      </Map>
    </>
  )
}

export default MapBox;