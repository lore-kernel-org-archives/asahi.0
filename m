Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9473B9D96
	for <asahi@lists.linux.dev>; Tue, 14 Apr 2026 09:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776157242; cv=none; b=ltQ9xZYn45doV5C94j0eJiwf8/oOEjh7DhnfS7ksJX6qzOTqMoTj/DJr9JuHfflIvnXDgKxXX7pAxQqOQsCCBWaK+bE8Nk4AL85PRQBARVUHXUAZf3hCEEbTPPbRYxT6qdU1Tw9uVB6tkRaZs+5pReL2WgIn7qKetJ7cdCEBQ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776157242; c=relaxed/simple;
	bh=7BzH4l41ivGVwJZyLUtzjEKcBbitAg70COzuLd4I7K4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sO4K7Hl8icEEyqTdlddyfyg4DNXtMRM5/TxjGRgFUVN6FztPVoHjhdufa+u8Mlt6cd0wFy420KU/wyUA2hzHhqTFsTQr4275+HxYbewIp5VOQavmORHdf1Uq3MAm6FD5iugabq5l6O/+WPjcl1I6FA/eDhdMcCbdh7yHJ4Ukcbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-40ee9b945d5so3923570fac.0
        for <asahi@lists.linux.dev>; Tue, 14 Apr 2026 02:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776157238; x=1776762038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7BzH4l41ivGVwJZyLUtzjEKcBbitAg70COzuLd4I7K4=;
        b=QA7owVu6mJTKaWvuD5FxHqF5DjkJNDNkCY1V8hEEQ4jn+0pmnx0GSjytkMkSbW2G8y
         9aGs2NXx8JhBxe1aor/JJIRWNykar8WrCNgXSOiFePBfWdQeC2HCckc+HuzkyamzsPDI
         CY0W3uLNxi9KSEjX7K5dVHWZf743vcuQrVdT1Prc0OxKUUtn29+7FQWoCh6msM2FqSje
         1cIVA358fa/6gDvvW/nrvmnrt08+1DKG1E1rMMbR943PMfcpZg6q1uhubbRWXUu4Gm/F
         gr/oEjEVHyUHAZ+QNcGVGweYa1OH8soBnLVrpV5Za30Rn3t8Bq/PUZVNOFFmegGbHeMs
         JP0g==
X-Forwarded-Encrypted: i=1; AFNElJ97ZSNe0fOtDJjJ4jd8czJ5vnj9rSi9lRSl6WScUTVSkEDAsvn6l1tCNtlNmXnWpjYl2iPKbg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7vA4iVZZzFVhuE+T21KZq73MBnEvv6IRUI3X/NqpS0zpvdR2Q
	oV9qygmeovlMjhhMjvC3VgHN14dEcZgEb/pNOCdWwVTSHYojEo+qg9hbnCzwOBYG
X-Gm-Gg: AeBDieux9JrbJ90VfA52VQb7KRsEKr31m3pFEtZcXLdvj8DLKkHEUTdhyfJTPoyeRYZ
	32svbMKILme8yiVlZLJVVfgEYI47HidUEU4fafkiP4kzRamuOhG5MygaQV7hBBkJFX8D4xz7N2Z
	T88SeoRDeohXMjtJArMfBMuEWJpxZfFIJ7sqfPJCO+8oKQ4Z0aQbS8aLd5Qm1UEmBnjKXRpvXcv
	jnN/NAYbsm0AgiXSnmZ4dEohdJE2QxSQG4oBrsapgo/B/uzpRSOBDhkfwjg/9M8c4vj1YIYIYr1
	OC+WLUJ4cjK5M2MPhBo2L0gPTxjl0pNUzOXIPZl32bvkchUArWvGZrFHUGFbGJaE2t4WbahUkW6
	5vFpf0wlEGLB3w1MKuUYS6kyuJxBxZeRx/cid3jlxLn19asavLZxty3TUOAsgyFPUpbS4xO4Oz5
	r5pkME1AWbYKeAr7k2rDCVJY5yXakKKpolOkNmOx0AQnAegHawUc73MGw0uWKdepzhxC+n+KpAW
	/cXjZp7Kb5jo90mk+fOcDFZzaxKDegv0DOmQMOGr25h3LitRe8vy/QreWMz15j7/C1EWbB4zA==
X-Received: by 2002:a05:6870:2156:b0:409:9a0b:b733 with SMTP id 586e51a60fabf-423e0ece7a6mr8983495fac.10.1776157237895;
        Tue, 14 Apr 2026 02:00:37 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-423ddcf0376sm10855655fac.18.2026.04.14.02.00.37
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:00:37 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d556c1a79eso7287525a34.3
        for <asahi@lists.linux.dev>; Tue, 14 Apr 2026 02:00:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/OucEaGfYVq3eusVWG4QJuv/NzL78XgiQ2O69IBfqI8MFQvEIz8aTM9QmC6KvhDfO11GyOoA==@lists.linux.dev
X-Received: by 2002:a05:6830:6d44:b0:7db:df4e:f937 with SMTP id
 46e09a7af769-7dc27ca49a6mr10107828a34.7.1776157232558; Tue, 14 Apr 2026
 02:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260407-brcm-prio-v2-1-3f745edf49af@gmail.com>
In-Reply-To: <20260407-brcm-prio-v2-1-3f745edf49af@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 14 Apr 2026 04:59:54 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-dvJA4yLJxwiJVg2S585Dihg4c7FTyf0Gv8iwahU0ifg@mail.gmail.com>
X-Gm-Features: AQROBzBGriz3oUw4obwCyMl6uueqnkEVGw3CzezDOXXcUajBdgbMcTOpUgPlHRE
Message-ID: <CAEg-Je-dvJA4yLJxwiJVg2S585Dihg4c7FTyf0Gv8iwahU0ifg@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: Add Broadcom channel priority commands
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 1:46=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Certain Broadcom bluetooth chips (bcm4377/bcm4378/bcm438) need ACL
> streams carrying audio to be set as "high priority" using a vendor
> specific command to prevent 10-ish second-long dropouts whenever
> something does a device scan. This patch sends the command when the
> socket priority is set to TC_PRIO_INTERACTIVE, as BlueZ does for audio.
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v2:
> - new ioctl got nack-ed, so let's use sk_priority as the trigger
> - Link to v1: https://lore.kernel.org/r/20260407-brcm-prio-v1-1-f38b17376=
640@gmail.com
> ---

Thank you so much for this!

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
