package com.dwirty.beans;

public class Notes {

    private float noteEvaluer;
    private int nbrNote;

    public Notes(float noteEvaluer, int nbrNote) {
        this.noteEvaluer = noteEvaluer;
        this.nbrNote = nbrNote;
    }

    public float getNoteEvaluer() {
        return noteEvaluer;
    }

    public void setNoteEvaluer(float noteEvaluer) {
        this.noteEvaluer = noteEvaluer;
    }

    public int getNbrNote() {
        return nbrNote;
    }

    public void setNbrNote(int nbrNote) {
        this.nbrNote = nbrNote;
    }


}
