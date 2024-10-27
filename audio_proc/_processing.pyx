import essentia.standard as es
from essentia import array
cimport numpy as np 

cdef analyze_birdsong(np.ndarray[np.float64_t, ndim=1] audio_data):
  """
  Analyzes birdsong audio to extract note information.

  Args:
    audio_data: A 1D NumPy array containing the audio data (float64).

  Returns:
    A tuple containing:
      - pitch: A NumPy array of detected pitches.
      - confidence: A NumPy array of confidence values for the pitches.
      - onsets: A NumPy array of onset times.
  """

  # Create an audio loader (adjust sampleRate if needed)
  loader = es.MonoLoader(filename='audio.wav', sampleRate=44100)  
  audio = loader()

  # Pitch detection (using PredominantMelody)
  pitch_extractor = es.PredominantMelody(frameSize=2048, hopSize=1024) 
  pitch, confidence = pitch_extractor(audio)

  # Onset detection (to find the start of notes)
  od = es.OnsetDetection(method='hfc')
  onsets = od(audio)

  return pitch, confidence, onsets
