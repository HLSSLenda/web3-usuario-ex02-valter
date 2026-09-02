package br.edu.ifpr.irati.ads.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "sequence_usuario", allocationSize = 1)
    private Long _id;

    @Column(name = "nome", nullable = false, length = 64)
    private String _nome;

    @Column(name = "email", nullable = false, length = 64)
    private String _email;

    @Column(name = "cpf", nullable = false, length = 14)
    private String _cpf;

    @Column(name = "dataNascimento", nullable = false)
    private LocalDate _dataNascimento;

    public Usuario() {
        this(0L, null, null, null, null);
    }

    public Usuario(Long id, String nome, String email, String cpf, LocalDate dataNascimento) {
        this._id = id;
        this._nome = nome;
        this._email = email;
        this._cpf = cpf;
        this._dataNascimento = dataNascimento;
    }

    public Long getId() {
        return _id;
    }

    public void setId(Long id) {
        this._id = id;
    }

    public String getNome() {
        return _nome;
    }

    public void setNome(String nome) {
        this._nome = nome;
    }

    public String getEmail() {
        return _email;
    }

    public void setEmail(String email) {
        this._email = email;
    }

    public String getCpf() {
        return _cpf;
    }

    public void setCpf(String cpf) {
        this._cpf = cpf;
    }

    public LocalDate getDataNascimento() {
        return _dataNascimento;
    }

    public void setDataNascimento(LocalDate dataNascimento) {
        this._dataNascimento = dataNascimento;
    }
}