Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A356818
	for <asahi@lists.linux.dev>; Wed, 13 Dec 2023 18:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AV7URd7X"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5e263e43ff2so15739767b3.0
        for <asahi@lists.linux.dev>; Wed, 13 Dec 2023 10:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702493013; x=1703097813; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Py7pGp8pdHDiaozPkIU0AHzFq8SxGOJ+oThpJ6qUk8=;
        b=AV7URd7XNkV3/h32kOitrGA8RypwMRalChuBP5a2AsZeKqUHk3rwhAN3uG8DTDu1Es
         +4doW/+r1YepHJ8U5+olwMlTxpJtJyoKZQE9RDejK0Mxf8UoBaaEOv7JUSHFxgsHdVUL
         MoK/TltoNJkyMFTC9MEa+nEBTslwBWbQUTpLBjWGKgUGpkt8wfrFLcEPkRnCz70lTCs1
         Yc2d+tSlPmsDriqkNNoq4M27qanry1uFQfJKsfHLuRl1E2e9VVt2kfJLx5N/k2DwEVdg
         mtgXnq3n+5IBtvyYfDlHlWMY1wzYvmCpGki9/WHAMrl3HSpGiiH7owbDygjCYhxsmFXB
         +29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702493013; x=1703097813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Py7pGp8pdHDiaozPkIU0AHzFq8SxGOJ+oThpJ6qUk8=;
        b=YMSGj/lZsheV2CZjN0d9OzcW2TEdYXjDVPGD84DqGSE5ATxIAeUAhDW8m3qiVqeCXv
         mQuEg54Y/dRNGf+hq/BF0dhvEryC2jHYVn2bfKBNPHdsGEbVS3OL4THMafS3K7/hqkVp
         m7MO/MTPtq7MQjcFvdRFRJPO3WzFmdicXoyY/E/ZICtYxh7PTdXZ9HZmWML0LigWmIq/
         3MKWdWThUjjaQH5ExApKNW5eN0lcQWfOGxt0wVSELBfcymbh7U1qvhNNQ5nTzuCT6liK
         dBeueH0xuoDqQERzOn9qHyn0G+xNlXZH0DmWOC6qNP3X3k2LmHiRd3zIDPmz4DCAGmJ1
         MYLQ==
X-Gm-Message-State: AOJu0YybkwxL22ZZjCBOrGlX6PS1OdvjKTVe9vifpruUrGI502LW3noI
	BYof7euxlKrZdewoWVqLa6G1Ck4QbqnLsCYnXH0=
X-Google-Smtp-Source: AGHT+IFB4zWxh1M3w3CvBzyO4rpXYYmJgL1IXBNWAJoRVWom5OIFB/LGcpzZKJ1btMxOVZajc1S1A+iIyRqn5nNfjNY=
X-Received: by 2002:a0d:dc83:0:b0:5d3:9fcb:b699 with SMTP id
 f125-20020a0ddc83000000b005d39fcbb699mr7277271ywe.49.1702493013147; Wed, 13
 Dec 2023 10:43:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230714-cstring-debug-v1-1-4e7c3018dd4f@asahilina.net>
In-Reply-To: <20230714-cstring-debug-v1-1-4e7c3018dd4f@asahilina.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 Dec 2023 19:43:21 +0100
Message-ID: <CANiq72n0OiZ8_Ot8-PxU2rV8k+qrAdk_6tvCiWDMMVr7R7nbsg@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: str: Implement Debug for CString
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 11:19=E2=80=AFAM Asahi Lina <lina@asahilina.net> wr=
ote:
>
> Trivial implementation.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Applied to `rust-next` with the commit message from Alice.

Thanks everyone!

Cheers,
Miguel
