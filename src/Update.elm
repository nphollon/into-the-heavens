module Update where

import Set exposing (Set)
import Time exposing (Time)
import Keyboard

import Mesh

type Update =
  Meshes Mesh.Response | FPS Time | Keys (Set Keyboard.KeyCode)
