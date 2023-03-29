Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAC92F30
	for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 15:05:02 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id r187so19700817ybr.6
        for <asahi@lists.linux.dev>; Wed, 29 Mar 2023 08:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680102301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbthZAg2EI6S7hVKN4zQsrXR4eiiYbr1ymfLGy5VzFk=;
        b=O5b3QarlhM2wVotMDKJUIS9Ke9T+0xCUt+Firm4XuSeUk+ujnTGb8urU0KFo8uZmBM
         i2AJTxnng7A+PGuSX8Ie/c1+e13XP/7vwk6ggHZh4iWh6Zxo5r/m+eo06fvF1ihMfHf9
         eSiz6oVNMU8aboEpamh6FZ1vip17ca6B5bDUUlKuINTJ7HL9+JGDT5Ws9SQ1LA57zyLI
         RvK7NxzJ1fR2gca5un2xJYkhBUmesWtP+RMuJW9R21aVXOhV4olFh6KMyyW01NiYvjNF
         kc6DiySPtYSASr44CsUvHPhW6pqdc3BYm64nW9fHf+OxZ2seO6ZBclngdyL2pf2nkQP4
         MdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680102301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbthZAg2EI6S7hVKN4zQsrXR4eiiYbr1ymfLGy5VzFk=;
        b=By5llZ+UTWNFdXb3Hq3SJzWwdabPMMtqR0BgbylVZh/JTW9Ua6bqdZUuUZawYj0W4m
         vX715qRlGW6N0HSKFdPPK680+gfOkl//kfrORdocgQvUOfyOJdTzjfc2RKq6TYjG76fJ
         pxn5LL6PK58ASYLsAwKoRodKW9QLHoER26W86EQ2pRKUf0zKXaTlrYX6BYNTNXHyVrq7
         NwAfLYy8RyT0c1zxVVH/EHVtOD+yZu6Lwrit5B3uA+RTIs3dOc5u1N/L5Wxz72FpB1Kp
         eFuQoEB7EOPoPmw+TbI93P7cbEb8GNIMShi90+8DAyf90uOcTY47ktPVjH3/bmMsL7/r
         zpjw==
X-Gm-Message-State: AAQBX9c3HiKPhVqwZZy2VJPkb2XEe8Mv7phY1sPZ/eBXzf3XrRv3k/aC
	hkZ9yAOQPp9ZXwVwugQS+3a9kVPX8MYzwrY2UUo=
X-Google-Smtp-Source: AKy350bX9861FLdgC2783Ji32zVywDnx4KhoXmIAZH6o1cbNCCb8RVfB1pT+qcgCDnwsz6YsabM/NughBZ3ZsnXR2kU=
X-Received: by 2002:a05:6902:1004:b0:b75:968e:f282 with SMTP id
 w4-20020a056902100400b00b75968ef282mr12771867ybt.11.1680102301286; Wed, 29
 Mar 2023 08:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-error-v2-0-3900319812da@asahilina.net>
 <20230224-rust-error-v2-1-3900319812da@asahilina.net> <0849f870-2d95-8c3a-c7dc-2b18dcee4c65@gmail.com>
In-Reply-To: <0849f870-2d95-8c3a-c7dc-2b18dcee4c65@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 29 Mar 2023 17:04:50 +0200
Message-ID: <CANiq72ko9tY4dsK9Srte2oYQp8G=PMyLDTOR33-yNTVXmfyzeA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] rust: error: Rename to_kernel_errno() -> to_errno()
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Fox Chen <foxhlchen@gmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 4:47=E2=80=AFPM Martin Rodriguez Reboredo
<yakoyoku@gmail.com> wrote:
>
> Reviewed-by: Martin Rodriguez Reboredo

These (in the different patches) are supposed to have
<yakoyoku@gmail.com> email when I take them, right? (no need to resend
them)

Cheers,
Miguel
