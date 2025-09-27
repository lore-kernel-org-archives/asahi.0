Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF5B45C0B
	for <asahi@lists.linux.dev>; Sat, 27 Sep 2025 02:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758940150; cv=none; b=TPVbdXvmi1/1M6ZzOCNV1ENA8zQI+cpBG+xna4zOTJwkUAs9ViNBfJUkB9qGugNs1eY97c7WWYStI+C2AUIZ9DJrluQo/P0h7vqjPo0QDZDEiF4QBdoVSRVanA3MNGObyfvZ09hmz04ZPj3000zlJLW7tdxo7vAeThq19QWFFZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758940150; c=relaxed/simple;
	bh=GIPnusP700J5lEYYX7UIiuxp43JikbB/9frzCsSPEbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lcoIxzVYnHdDSGbWFGL6+0ka4OpHClORFg1DifDxc3J1mesgvNFP+mPC3VEQRb/ORuffISegvTjat3Qv8ebajYwxa+psK79BVOF+V7S+hhX9udLS6+oOkS6/9wsDxBOsQZDqR6c0B3PpdKqR4F/ZG9ZDCjAIxf9Vk2CPUg1WE4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-634c01ca9dcso1743021a12.3
        for <asahi@lists.linux.dev>; Fri, 26 Sep 2025 19:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758940147; x=1759544947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DevKPTwMgnfMY33tLxNP7YJQ+kh/p8Il+2rzMT1+A4=;
        b=rNV1j8/EovBerW9ODyryVGjSDeZECIGLqu0tZpyFuLpMSv5IkNz6tzPkYwb+txqjDg
         azrK/1PmrH+4N2B5F70gOj6SBkAlExyUxYvLfgFd1+csKUNy+ueBDWQldv0ZT7DRi1Fc
         TQsnr5SThKgq0h2FMMFpVRhD3oACfFIaW2W23WjqSdgW45/jVObg1pGVqh/oqjtjvicU
         XIJU7cQRMrELhAKQz9yGDDz4riIFbAjpylBgaAxh0bqrU+aPeQE/pmy0zqxTCXvAtfIt
         oEUTtGr3Yz167xSxfbYTaxd+pgCVkDL/N18iEwPjSRWvnNRR+8m36XeCqkzII3I5m40G
         qiQw==
X-Forwarded-Encrypted: i=1; AJvYcCU5rnKI+vEDSIJQGv/xLgUKCsWTlJC59eeIzxMYBb6q+T217/J27VtMOMUuqJJFPy4W4aQRuw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZUO3FEMMya1LymfFup1TokiVH4Wh0UApAcY9+cm+j12utauVL
	6bn7SrPZJ9H3JN0HWpvkm0va/lWUFR+cNbcpji6ZpueMPM4vQzDDlkmHvXAEvCL/
X-Gm-Gg: ASbGncuLUpsjy3ayNBOUDua+IeuIYK7jrQ6ohJOyw3/qrVM0blOaK2OwK+cOwa9lPb3
	N03+QkqC80w2FG0AFeYFLuIiCbdBTOtiT+HSDIdUKpUfPeGGInmGDLzA0KpEzEpM+RiNtNdHlN1
	lQrzzfVvZVO1Iji+OQJ31AFg+Vhs0uewTfujlXnbzHc9m0kpz1Pqv1l+11FlmIGWb0D/ceHYNj0
	GLpq9CDqBQdfZJX3XvnSmRBSAf043p4gGEix4yVS1TFnCnzQiCVIoPFh+SeQCONRAOod4qeRLnY
	2AkVq3K/nfAGVOvhk0Ng5QBPwT+jAiZ7SwLJhH1deypje/FdO+OJQrvzG/WaXLq8TD93U6uaV3G
	NqStBmlwl+qBvPc+3qwQCX0zvlDYGckcrKECWPVBYTHzXHLhnlcEV0q1U1o7atMRzqAp5X0HnMT
	qgoGB3GDHw
X-Google-Smtp-Source: AGHT+IEXbdjmfM3s1ogIHVo5caVhvnlHpTHEIPKgjeuZNXS1cm9zzK7lvUS3HM3IBIQSgMeG3XA8/Q==
X-Received: by 2002:a17:906:7313:b0:b37:4f78:55d1 with SMTP id a640c23a62f3a-b374f790f61mr742972566b.17.1758940147045;
        Fri, 26 Sep 2025 19:29:07 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353efa46b2sm473830766b.24.2025.09.26.19.29.06
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 19:29:06 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b38e5c2e055so194119266b.0
        for <asahi@lists.linux.dev>; Fri, 26 Sep 2025 19:29:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWFcwizzEQDyj03oMmlFT/C34ygg+WqN6YZVM93g1qj7CP7dbr7cFhyDHRs6870sZ4zrdNECA==@lists.linux.dev
X-Received: by 2002:a17:907:2d1e:b0:b2f:963:1d2f with SMTP id
 a640c23a62f3a-b34bef98b74mr1061773766b.51.1758940146614; Fri, 26 Sep 2025
 19:29:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net>
In-Reply-To: <20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 26 Sep 2025 22:28:30 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-+dK+Weixf1iP7hn6dt_CXWTYraA=TSr=rMPkyoJVHbg@mail.gmail.com>
X-Gm-Features: AS18NWD9i2Ce3lSv7X8ID-5SK3bN9ENqRcod81yTbnB7Qdrfx1pZRHR_ctdLGks
Message-ID: <CAEg-Je-+dK+Weixf1iP7hn6dt_CXWTYraA=TSr=rMPkyoJVHbg@mail.gmail.com>
Subject: Re: [PATCH] mfd: macsmc: Initialize mutex
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Lee Jones <lee@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 4:33=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:
>
> Struct apple_smc's mutex was not initialized before use. Surprisingly
> this only resulted in occasional NULL pointer dereferences in
> apple_smc_read() calls from the probe() functions of sub devices.
>
> Fixes: e038d985c9823 ("mfd: Add Apple Silicon System Management Controlle=
r")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/mfd/macsmc.c | 1 +
>  1 file changed, 1 insertion(+)
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
