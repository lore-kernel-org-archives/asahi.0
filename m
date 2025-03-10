Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBD018C011
	for <asahi@lists.linux.dev>; Mon, 10 Mar 2025 09:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741599018; cv=none; b=rnB9kY/503A3r0SwD9PVZlDF7vn95lHemJMlP1piUipx3CKSDnOfh+/aPizEmV19P3K9DFdbfwXDdpbF4j9nVaqeb5yz+ZdXEoKHMFuwPEmFy6GAKk6ddENIZZ/S09ZfaRrU1h6TG7NkAEJwaQLOqPljJb88WntF3bahiU5t0FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741599018; c=relaxed/simple;
	bh=jUtUQg74aR+QT1pHvyCm57vRLK9jOPZ0YAQlpRfOnKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jJDVcc7JZKZYsjLeIu1tTiygOHDrfm7sUgQIsPJMMCCRUn6Kxy8EGX/a62gArbEQTAhGFbY5K/GLaQzmphq794FpxLLCmyhLQFgMTfbGYR9jtFEklYuDlUMnT5/dAASG4zeyGYUM989+X4YeuigARg+NbmbRoRe0wNNv2FrvirU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G88kdQ9X; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G88kdQ9X"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so4890620a91.1
        for <asahi@lists.linux.dev>; Mon, 10 Mar 2025 02:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741599017; x=1742203817; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5PO1nUn7Da+eSXJyU+EvbCSWkrbL0y5pIUDKxSEvMI=;
        b=G88kdQ9XKLj2uN6oj5A0eFQ3Kb8j/JcZNpRMUSlL1yJS2jqtQSMbVNOboI96xjTJ9V
         PPaXERUwvIu9ioff5yJrUGoAS82OELbjwhXeO5WZ3M9yoKwypjiUhashWKdRytVEp4Y5
         QBAMT3tCXq8qvCQH3x/Pt3qliDRqj/g6XCOea74rNc+5QwADMVNvv7FL54Ky49Ph9Lh7
         lcBs7tyUZ0+8Zl+uOQWuUaO32O2eGX4+nONACgZ8JgzaT0b9THxPcWWpWkpBkc50oSxH
         mTtNP56PBcUpIgzCGUaq0JCKgwZHYZLI9RZgWmGf8w0EDotloIlzv8d+s7NNc3Z36LIW
         mNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741599017; x=1742203817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5PO1nUn7Da+eSXJyU+EvbCSWkrbL0y5pIUDKxSEvMI=;
        b=vMb1+YFny4wceDPqzFNuDAGTy108yc7DHSc+ZzQ2ystbDQBiYdKBk+WoQV6hgAA21f
         qtKKJfPNsqCl7NEHjTV9th4sRRklU+maihtK7nIjT4DpaipKlybbiWfnOfYa7a9wnwP0
         +4S2InLCbS+VAfJd4D+MTMVtY2akByA3VDmCPKlSyrUDE6Gbohi4ok/F6gtpd0dZUNwf
         9qgGjGoEYyUvm7QA2OIMbAWX/O8y43kj1kFnAx7LJJOxBDHInP1aWCL2uIWGeS4SpOc0
         OtHSqWe+j04A6yTMOfL2y+yJkA4eT04NqiM9yD2FmVrAVQhB5dbEoSoNjsI/ESeJgEc/
         uH7A==
X-Forwarded-Encrypted: i=1; AJvYcCWkhJ1+9UtZRLPtP/Kwz2hftzjNer018bWM3H8RhIx/BGO1IVH+l/H2/i0HN6X8gtl8gRCENA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYyOHyIdSEg9Jg3R7hnCopy8P60ACSRd5gKou8eL7avSldMhMV
	/CskAI8GsH/IKyUVCeJGLcqF0pr96oCqonkrVvbzqJc4UqubVm/v
X-Gm-Gg: ASbGncvOlIdn4d/eVAl+ozCyQgbe+aRUsxP6Noy139fCbGAK5ULV/9px1CDwaTipU3B
	tewr43etwtngP1mz93hS9sN0b+hyzWA4lYgOI/IzmzAbJ8O55gA55qwsrlY/EMUXSx2RFjhPghZ
	iB2qWFHXNayGxX+kjO0LYiCcZODL+LSNDqQyqO2TnlJKfyUbKucJJr6V0v9mzFZXNZKxUvKjnN0
	Jk4SmS7krj9pWFXwLx4ML/l9vRMnDcVldS/S4a9eAWcKGk1+Y6pytaWq9yZmdZiuiqhzD5hp85X
	7voNN3Azh9gTH2wTjYeLgjpGb1UnLzIhDSGkf9UOTIaxFx1MTCYv8riBoUd22Ylmk8Vzbk3KnWu
	KzhfvrtxPOOrVAQo906VPb9POyBZVMP1t4V8meP+/PaA=
X-Google-Smtp-Source: AGHT+IGUUow1W9RHWgrDcswCnQbDzoJQvZyLilCRmisCyeH8NamOu+V6JXATKLMsX5Bdy5T6O5mGzQ==
X-Received: by 2002:a17:90a:e7c2:b0:2ee:aed2:c15c with SMTP id 98e67ed59e1d1-2ff7cef5ce5mr19339490a91.28.1741599016487;
        Mon, 10 Mar 2025 02:30:16 -0700 (PDT)
Received: from setsuna.localnet (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f98esm72725035ad.155.2025.03.10.02.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 02:30:16 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shi Fu <shifu0704@thundersoft.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject:
 Re: [PATCH v3 17/20] ASoC: dt-bindings: tas2770: add flags for SDOUT pulldown
 and zero-fill
Date: Mon, 10 Mar 2025 19:30:07 +1000
Message-ID: <5996925.DvuYhMxLoT@setsuna>
In-Reply-To: <20250307205156.GA583954-robh@kernel.org>
References:
 <20250227-apple-codec-changes-v3-0-cbb130030acf@gmail.com>
 <CAHgNfTxS1Q4PPsw520-J4Yn6xg+QZOYFkYhg5yv-uZFu5waN_g@mail.gmail.com>
 <20250307205156.GA583954-robh@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Sat, Mar 8, 2025 at 6:51=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
> How would it work when you need a mask? "dai-tdm-slot-tx-mask" is
> enough?

The existing TX/RX slot masks are used to control which slots the codec
is operating on, AIUI. I don't know if it makes sense to alter how codecs
deal with this. Could we combine the suggested dai-tdm-slot-tx-idle
with an optional dai-tdm-slot-tx-idle-mask property? From the machine
driver's perspective, the API would then be similar to the existing
set_tdm_slot ops. The current downstream macaudio machine driver builds
its links by allowing multiple codecs and CPUs to be linked to a DAI,
like so:

dai-link@0 {
	cpu {
		sound-dai =3D <&cpu0>, <&cpu1>;
	};
	codec {
		sound-dai =3D <&speaker0>,
			  ...,
			  <&speaker6>;
	};
};

In this case, the codec-specific mask property was added so that a mask
could be applied to a specific codec rather than the whole dai, however
from upstream drivers tt looks like the way this should be handled is to
have "dai-tdm-slot-tx-idle-mask-n" properties at the dai level, then have
the machine driver set the mask for the appropriate codec during setup. So
for macaudio, assuming speaker5 requires this zerofill mask, we would
have something like this:

dai-link@0 {
	cpu {
		sound-dai =3D <&cpu0>, <&cpu1>;
	};
	codec {
		sound-dai =3D <&speaker0>,
			  ...,
			  <&speaker6>;
	};
	/* equivalent to ti,sdout-force-zero-mask =3D <0xf0f0f0> */
	dai-tdm-slot-tx-idle-mode-5 =3D "zerofill";
	/* should this be an array like the slot masks? */
	dai-tdm-slot-tx-idle-mask-5 =3D <0xf0f0f0>;
};

The machine driver then calls something like
snd_soc_dai_set_tdm_idle(speaker5_dai, SND_SOC_TDM_IDLE_MODE_ZEROFILL,
		SND_SOC_TDM_IDLE_MODE_NONE, tx_idle_mask, 0);
and the codec driver deals with it however it needs to.

Regards,
James


