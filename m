Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E899E26738B
	for <asahi@lists.linux.dev>; Sat, 27 Jun 2026 09:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782553004; cv=pass; b=K1XaJEDilKue9haJEEdxO9W4VWKNF/LHE800aCwDfw/YFAjTkJDNlgEGGdp2sBdXgGDV+NQ2KRhM26YnOCFRuB9V8noS68mNq5oDtV5347NQwPLsKNyGvy1NVm/JiU/AfnBzY+Dd30CbY52I0g4kg8XNunPsiGAsfJzbEKIPiH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782553004; c=relaxed/simple;
	bh=mEey0mZ/YQUVVRfyx512hS1EOJH/O+P7h4hxapMTi3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtdgwkDdsHiJqVcprg6mxdh3fdXn6RNXhqJ2DzJqrQL+DxBIBReL24bYt3cELmLcUGYiNlPHS0cGnE/nNCf/5zhd2bBfn0hD4KUL5ns3GR91tWZzZxKMn6WoBUX9pe9HkSa5OvoLWT6VZhiEY4afIg1Z5pc2+JY/3G7Yx1T8eGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ik8iioXr; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ik8iioXr"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37deb2d3a82so1090411a91.1
        for <asahi@lists.linux.dev>; Sat, 27 Jun 2026 02:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782553002; cv=none;
        d=google.com; s=arc-20260327;
        b=jhO1CuUhxmQPLwf0MkDKkMJkXoqhMkUqYG1/OMkcUDN2ys9cdFsEzYjTr5YjSKEI85
         Av9jI5RAgYExM4FEcKnih4v/JRH1fSD/Yu0wOcqFKkWyL+KT8xN+vJnzsHDm5nMpysNL
         BQyKpNs9x+ydgHgIUGOgxbe1b31bdHSPDrrQ0QMfDZisFw4aTkaytM83YJdIKmehr7lf
         Y8qDYqEEaaCPNgBQdnL6HHpPQqdg8ez9CzQ6QsnvyYXWiH2KjT1JnbW2jZQa43FnohSb
         +YeuaFSov4bp0iqGBzDAiYZOmUCm6G9vqJSwBxhcTwiMfzNVYiERzf2l2zCR/FTZbj/w
         WorA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F7KzJOcndkUz3Ry8eUCgjC+tt1RI1jNQwCqw+jy3H1c=;
        fh=7sW7wL7udef2sN+AI2PbB3x++4ng3rMadN+q37zWe9o=;
        b=g1TfV0EYcoiVA4wg6sHuXNVRU/tcTyIpzGM2meOL/vhwYmMBxxDPeUxDMeBq8kyRZv
         YOJb+bzbcwR6DA6P4s99Awrm/ZksOLeLnTSAsRB2bTk9e6opH9LgwKDUoUSxGcUWEk/f
         VO4lGRHV7MhF8Yo92kltJ2N/mXCVCDpru2gXlt8wvH9ra+4+lx3AGIZ1Ji4w1i2RYh5f
         fbHRMDVDxaAkSsa7dtyfizKXC171dIw2izmlX9RQef/AbIupRmpL/pTswrVZwMImnBma
         LEqQUq/s29GwMZfP14rJl46IXnONlSk+OKEJKCWOBG+TvrcT7Gkq2GAlt6yOyJ94WGw6
         ImCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782553002; x=1783157802; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7KzJOcndkUz3Ry8eUCgjC+tt1RI1jNQwCqw+jy3H1c=;
        b=ik8iioXrDgCGlCExJS9+IBOE7uLuXFQd/hwgJgJiFfUl9JIFjNI6P4jUA/x6Vtkflo
         cPdHbT3oho3KPlKNNuYztJSiQSUv8A6tCLNV3zsZPtaWYNEkiRarzicgrrGteURlk2CV
         ry2UIzlR5yfITyHHKmLiINfJ3yC3ioMZol48m0oCaTsEplYSGvJwTx4tcQYwgJN1zeWv
         idGK31UpEwewNOH4DbNTt5exIjExIdgRXSu5pUtbF/rFOonfQQPN4qKRDQpwW2NWtZeA
         XV2gQXD+ZjZIGiy1tyvREs9F1j/v1GEYwBncYmb+ZvIelIIqBuHdYAIl7nnvHUg48wy/
         VRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782553002; x=1783157802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F7KzJOcndkUz3Ry8eUCgjC+tt1RI1jNQwCqw+jy3H1c=;
        b=f8oxEKTHE+q+yKfDz5gNrhRBiMMyGxJWIXnA633GHs3yeS6exJU9pcAuXRR3T/lw82
         OXVjVnrwxWLFVX2lgrH+0KMOlbUtSbj0SBiF1Kr+WodZFYGLtuoDygecgmRppVV/e/tI
         Rznd4KgC5EGMCVVlgaAArgjRcOvGdMWRj2NfWgRjJxcXY71FcxH+7q17i6u6Xq5illnG
         QvwiIS4iIvy4fXbpjjOY5cj6Sjo+mpvWvtiYczUKcOwiWfdOotOwv60L4+6WX6ykpSMX
         K6+258Kwh1fXCvDLLbMQPyYD8h+5a2jJRpSWc44LDv2A3j3hf0Xf3Z55vsPWUzP9pnD5
         KRFg==
X-Forwarded-Encrypted: i=1; AFNElJ922XpzZZxVz+Wz7zeNuZsKtTmYy8zI1x8UzySkYu078V8GtIQKGNMkbqvE3ia503pEVGKqvg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIViw3W29+RvsWCmk60EVxXJBbxp3k7WD0SA23M4SdCfhhOhY1
	Mxcgm1sPqs8kWbteGHpblzELiedkMPSSfSe3dJ94X6N8cpa92gUr2G3ttVMi4ygpiCqCwfYsrTs
	rkoAGOR6iiLw6nFfw4CJ8YKxy6Nn523c=
X-Gm-Gg: AfdE7ckQZPpsgpDqV8M8iMnAZl6icJUfCnXB+ZQfPhCbABtvDql9f7cF2QUbR8I48VI
	eiyp/ypD0Z7T31bdoJhcC7WcznXSgMbxJR/RehrquNcO8QM/oPAhzTwmKnYMxzIPHUT35uP5JLy
	5bHZgRBz2i/AFb+ZUzalIc31A2SXoR8ubPQaJRs7aoNjT9XqCvl6FP3HLSZmme9P9pgNQpvtLl5
	0iirL5Kp4jfxw1HAp3wkEgJHgYdjD8jwNBxUAlIMfXtHUzB8iVzKinOjNs0F9yf8n1n3ykt6uts
	hAdfAwwDQO7jQAYtSGW8P2ZrlzZHHTKess2B1r/y9Cf3q9ouGpyPlYqPy2+Wvw==
X-Received: by 2002:a05:6a20:a113:b0:3bf:7ab7:98a4 with SMTP id
 adf61e73a8af0-3bf7ab7993dmr1131724637.27.1782553002174; Sat, 27 Jun 2026
 02:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626061329.23264-1-phucduc.bui@gmail.com> <20260626061329.23264-24-phucduc.bui@gmail.com>
 <aj5tUdjxlzkDIim1@opensource.cirrus.com>
In-Reply-To: <aj5tUdjxlzkDIim1@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 27 Jun 2026 16:36:30 +0700
X-Gm-Features: AVVi8CeL_jVD37I0a5oLVQTKzU6vWi6apDu8KwNvmQOkUF5YXGnGH1JqPRV7teA
Message-ID: <CAABR9nHdqPQE9U1jA0J8RwUpgpcnFXXvx+bTPEwAWBzLn6=ahQ@mail.gmail.com>
Subject: Re: [PATCH 23/24] ASoC: codecs: cs48l32: Use guard() for mutex locks
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, chrome-platform@lists.linux.dev, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 7:15=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Fri, Jun 26, 2026 at 01:13:28PM +0700, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > Clean up the code using guard() for mutex locks.
> > Merely code refactoring, and no behavior change.
> >
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> > -             snd_soc_component_update_bits(component, base + CS48L32_A=
SP_CONTROL1,
> > -                                           CS48L32_ASP_RATE_MASK, targ=
et_asp_rate);
> > -
> > -             if (change_rate_domain) {
> > -                     cs48l32_spin_sysclk(cs48l32_codec);
> > -                     mutex_unlock(&cs48l32_codec->rate_lock);
> > +                     scoped_guard(mutex, &cs48l32_codec->rate_lock) {
> > +                             cs48l32_spin_sysclk(cs48l32_codec);
> > +                             snd_soc_component_update_bits(component,
> > +                                                           base + CS48=
L32_ASP_CONTROL1,
> > +                                                           CS48L32_ASP=
_RATE_MASK,
> > +                                                           target_asp_=
rate);
> > +                             cs48l32_spin_sysclk(cs48l32_codec);
> > +                     }
> > +             } else {
> > +                     snd_soc_component_update_bits(component, base + C=
S48L32_ASP_CONTROL1,
> > +                                                   CS48L32_ASP_RATE_MA=
SK, target_asp_rate);
>
> We can just drop this second write, update_bits won't do a
> write if the bits don't change and we know they won't from the
> read earlier. The original code was a bit odd, but might as well
> clean it up whilst we are shuffling this all around.
>

Hi Charles,

I understand.
I'll remove that else block in v2.

Best regards,
Phuc
