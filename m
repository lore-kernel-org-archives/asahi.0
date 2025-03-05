Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4765511187
	for <asahi@lists.linux.dev>; Wed,  5 Mar 2025 01:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741137568; cv=none; b=H/tiUdXAN4jTLbb5rUGbUHtfUIllbqY/Mc4tKQMZ6IGNyFIWLoq2FdHi86UaLiGZhhu21odtRxtd3Hp+oPZTvhBV1l9i66D1dv/AhKOt5hSVb53bva2GyRCmqMxVTV9oDvRu9MlEQnJUG5Huv5YaE77a66azjHW0/KrX6NMP1eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741137568; c=relaxed/simple;
	bh=aj7oEpRtbuTIufQ2FwedlFlVEGKMaqVdWjGFOoq8rgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uaHVk1hK3aiLKRjLw7CcMAZWSoNeHhLRFCWE16cVrWR/kXshRNV9Tkepbaw5S0tc/LQnIvjC5Yn14FaT7+EUI2+f7AeaBw73kLRGdW9P3dU6Qyj4LCgrWneRksHOudm8lbl2+ePJQp+3O4NKwQEQsOfkEA+w4NrRQy6hejoJdNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jc8pUgcq; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jc8pUgcq"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4750bc8d102so2856261cf.1
        for <asahi@lists.linux.dev>; Tue, 04 Mar 2025 17:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741137566; x=1741742366; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aj7oEpRtbuTIufQ2FwedlFlVEGKMaqVdWjGFOoq8rgo=;
        b=Jc8pUgcqrxBHTh+K/tK2FWibPpJzVNMcOo1lEJhaTG3Mhyq5yw0YQMRSf+UDDbhfX6
         AUR/dB8XM+70Gn54AcWG10q6ASFCztCAWNqRYBOwDBJ94+sd5W6HjhIhmeNdG56f6oCw
         8gPfOG4NumL+E7CkpgZiq5RFnWt5vRKUPQ7a8fBO64FBGgBEuMV3dDsdZImmdluIJJvt
         6gpBANLGxUk6IpMly0ffvKPjJxVdpjyKUI+BRXdZzWd14iTEeP0QeiQp+qxmdzbGFSih
         feFrPXuEEmsMGkYJA4QGqdNe7tfqQHdC5sJSK7e5AjawgNcF5kyYGiArok4ZISz08uWK
         VT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741137566; x=1741742366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aj7oEpRtbuTIufQ2FwedlFlVEGKMaqVdWjGFOoq8rgo=;
        b=pxwG9PMAWM+8XoP8s0VjfdCMlEl9agZQv9nqYuxfgyYG1XDDqEsfsMj9PjzuZkJrUN
         GDuAm16tp7clPqZoDA7FbyRTNMAlU5x2BUamGjKQHAF9Alt8vlFuri5oadjf7sEP9n7j
         m4PmpCu+5C+vj+IZ+dwYi7ZFNOG3VNH4ClGwLXmDSK+mmloJQ61dWHW3Y589angKwmv2
         /8AFYmSS1fiGO9+4+tfCfZgu0I3KCjyq/hKakBF9607yKSGPWBrUIdbw9+OFViqgliJv
         al2LgLlfmu92/cZuLIMN8d/s2jwWYjtpldGfC9utJ+ypnAg3yB5dhuh2BxsUeZBRcqIC
         FD/g==
X-Forwarded-Encrypted: i=1; AJvYcCVUAic9M8gqcoZ2jleIoY+uq6BtGjQXUQjoTyG4QclrsXeXgTu37N4Tg+xJipuWgAj0UwIieg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyABzjUI3FiQstWoKwDntoTp8gFKob4kIuw2SbgK87BqH7bWVaI
	m3ZxqS/hasZzVrbOpmXTdXeeDPVfwDvHL9dhDWfVap290rlDTHFIWhfa6Yj414Ysgy4nnRHJ/H5
	0C5+r7ReIn5VjcMGSMWFjbpk3pXE=
X-Gm-Gg: ASbGnctLrRxTk/BROgUwliHBWZBfrvvERO0gBaIcrrYa5AnNrhW/jt6NenIqRJR5cBV
	pnOdTgilg5HWhJWm5s4Qz5jrl/3YGxvygATW9InQ4bQcfyYRyZHVRoDEpd3NzlZWym4FYTjM3sC
	Yb7JYCscWOzoj2NtUVuREKybghINho6Fn/qtHakDRvT0OmRu1XAuhi0XSs
X-Google-Smtp-Source: AGHT+IH/gZVl6njT5r5xmoZsHMsCaVy4AHjZ3IvtwdL5qtNx7CdcXOgj41fRuij/xZmHZN7CAquryIOYCVl/RGfL4qE=
X-Received: by 2002:ac8:5750:0:b0:471:cfa9:2612 with SMTP id
 d75a77b69052e-4750b4c62abmr19008121cf.32.1741137566103; Tue, 04 Mar 2025
 17:19:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250227-apple-codec-changes-v3-0-cbb130030acf@gmail.com>
 <20250227-apple-codec-changes-v3-17-cbb130030acf@gmail.com> <20250304135050.GA2485358-robh@kernel.org>
In-Reply-To: <20250304135050.GA2485358-robh@kernel.org>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 5 Mar 2025 01:19:15 +0000
X-Gm-Features: AQ5f1JqKhAwj6qTqSfRCe3oGAAXCdiK5LgUlvxIRex-ch881UGzuk3RJ4ynlZPQ
Message-ID: <CAHgNfTyVKFuT0fZ3Qj=MdcXs67KscwkSepAH95xkAAKWM1g8Xg@mail.gmail.com>
Subject: Re: [PATCH v3 17/20] ASoC: dt-bindings: tas2770: add flags for SDOUT
 pulldown and zero-fill
To: Rob Herring <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shi Fu <shifu0704@thundersoft.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	asahi@lists.linux.dev, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 1:50=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
> Can't you align this with the other property you added? Or extend the
> existing TDM properties we have.

I don't think either option makes sense given the functionality. This chip
behaves differently to TAS2764, and instead of using a bitmask to determine
which slots to ignore, we only get a single bit to tell the chip whether we=
 want
it to fill or pull down *all* inactive slots. The property being a u32 mask
therefore does not make sense here.

Building the logic off the existing generic TDM slot properties would alter
behaviour of existing implementations where zero-fill and pulldown may not =
be
required or even wanted. This may continue to be the case going forward so =
I'd
rather make it an explicit opt-in rather than some unconditional thing we t=
ry to
turn on heuristically.

I gave some thought to flipping these bits if a TDM slot mask is passed to =
the
driver, however it can still be the case that we don't want both zero-fill =
*and*
pulldown active at the same time, or as above some implementations may want
neither, so we still need to be able to specify them individually.

Regards,
James
