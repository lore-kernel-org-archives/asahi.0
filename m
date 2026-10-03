Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA6D383C66
	for <asahi@lists.linux.dev>; Sat,  3 Oct 2026 01:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790991260; cv=none; b=Ch4qin2NbPqs2BTLfWw3rO1nviPx5mWtlfcmJ1gS+O+k6SImWs2NkoGo+/3PvihIzEtuWtmx15bT/bEUfSGYcIyU+aVvpUWUATo5kelD3a5tF1+0546SjNEXHzWrpB0/cAyYC/wokPqQKsN/YSZ/gNKc80ncBBo+nTk+kaRdFLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790991260; c=relaxed/simple;
	bh=dcN4JKaX3uG/6QlpJtazZDraUxMMRgZ4+sja8nBc76w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oB09MqPmhqJgJb1utsx+NtNmfrBLt17S61t8rYGsJGUMadNMXJ1R13eqEVKr6YJ61NW3mXuCaJx+eqXEaU0Ex6zUsllkc8CWMcUprA0OBQqXPVXii8XmHv+yaFWVsvZIdA87XB5c39qtAIriqkz6Wu8eHbv3UBL47o9h4QXALHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhMouKPZ; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhMouKPZ"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso59074a91.1
        for <asahi@lists.linux.dev>; Fri, 02 Oct 2026 18:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790991259; x=1791596059; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dcN4JKaX3uG/6QlpJtazZDraUxMMRgZ4+sja8nBc76w=;
        b=FhMouKPZBpjD3SRKkgw8guNnHDAoRow5qNVCm0buSUXmI9KbbciHhGTfZdxD5IBYja
         +EFezdA49G8m4GkwN/oWimUMLV7U82whs6ps/9aBHZsEwhi7CpDajcPtbZteyEB69/uW
         d0GfCXe+AmmVIVpKfnNIhRk8BoqF2ltE7ro51Dk9Tpm2d2+nI9ikZVnzLs2dv6yiDCVa
         Neu1nTOs9ceZ80ep92Nvtr5g9IFB5X1Kyqm/hBGhw2GT/UBbc4wk1dPliq3EKDOUV69M
         vbBIcnzo0YpqS7mFiagN9+RyF9XS/yOFk475W7I+ORpfiqMFd4an+HGkkonoQMcyJUZv
         hPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790991259; x=1791596059;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcN4JKaX3uG/6QlpJtazZDraUxMMRgZ4+sja8nBc76w=;
        b=LoC+PyltFaFVZ63GVkJ/e25GStyCB+q5OALgdLFFcpEdg8kO00Bs4HGfyjRT5npXcm
         nhwiVtU5rYGm7XSAJW0HoZk5qwxQFjAarnnCtn2JZc2CfIZpUbnQhPtJpnqm/2p5dPNK
         uo00KsxAhdk9/p1ToMNWf128sXc6VngkVJvSC6hNZR6N0Ea2q7rdwlcf6ufth8OaVrVB
         p4+BDPtEb6sqwVZFidBwmo+N65nCoYf1Ao3bQhkaW0xKshNkeDuumv+YHQ7xFiWCTZml
         OwVpdYIt9CqsebgJl0MBaESLVlC9aDlNHJdzU6H82z4BTp02sGe1TqCkvRLxFYMv3Sgc
         5TBw==
X-Forwarded-Encrypted: i=1; AKwUvBxv2gpQyIbR2lEufJczSDFeIhA8eL1tSDm1FO0h07Yr44DfJFoOwRyJu+6WV3S9rc2vSZFhDA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJpIs2DtAyKLKSX7CJHXU4CeFAdo7UATrFqJ8V2O/kwxEIbjvu0
	vxYS0qJ63DA/BUmWs96NKM6i2ruc4a+hP0IhkwgV5V/byYPQAq1tcmRQ
X-Gm-Gg: AYBFou0c5XkkduWAaSHaAst2cxAb5KJ902QM6wzLFowzsTvDmxnW8U3yPyR/FLQn+sA
	8XRbvU7ozHNq4r3+U+yjaeISRyGfcM156bxjZF2Iju4G+Ab0KGsT8Cdf0gOYl+xz6MfOSFq0Z+R
	ogZ1Gh0rabioForW8+w+VyciJPFcpZcFounFKtIVsAWIDpcLz4YqUxrGS6KbqoNopnjvDQevtS2
	iEQp5Lrd8JKQvtwLe9r9cfgaXC0hOkKKRQowIDowV/0s7Bb1G31CUy+x4tDz7H8fUJ1TWY/+uLp
	IM75UdioyuqP/NoF/JN7r5q9nUFE1rsh+tLnJ4XM1AKO7riWlzMCfOtdK4v2v4cWq2W7RxmvrhW
	AFpx/mpmLECcouxygpUj1yVIjF7jA/KLJX39uwyDocRYKQRVC1jk1tLOepJMna7T0D4AzmwwBxq
	1xVyFIpDnibIy/Y5EQT6SPLP+HLfggjjzGf9V6vSzpdwvs+xEqLsU6Gkw/xgVaM28+o6G69/kjG
	Z7v2yWmgC+w0zKCGUNkvMy+m/9j7JyrAjbWbLxC5ZefG43mmjRsL+wSrIBj0euldtADZEq3wyZs
	pkilo/uicrmXsY833lynwCtWP5WKjg8e7iqLnpZr/gVe8uDY0Ng=
X-Received: by 2002:a17:90b:3c44:b0:39e:6c6a:6577 with SMTP id 98e67ed59e1d1-3a6ced75f41mr3500888a91.58.1790991258652;
        Fri, 02 Oct 2026 18:34:18 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4664ebsm861575a91.7.2026.10.02.18.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 18:34:17 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
 linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>
Subject:
 Re: [PATCH 08/28] ALSA: control: Add kcontrol callbacks for lock/unlock
Date: Sat, 03 Oct 2026 11:34:07 +1000
Message-ID: <u9VW29vaRPGENsSTq9RHUg@gmail.com>
In-Reply-To: <878q4k2xl0.wl-tiwai@suse.de>
References:
 <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-8-741cc20a74e5@gmail.com> <878q4k2xl0.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday, 29 September 2026 7:52:59=E2=80=AFpm Australian Eastern Standar=
d Time=20
Takashi Iwai wrote:
> On Sun, 20 Sep 2026 06:53:47 +0200,
>=20
> James Calligeros wrote:
> > From: Hector Martin <marcan@marcan.st>
> >=20
> > This allows drivers to implement policy around locking/unlocking
> > controls, such as enforcing that a group of controls may only be locked
> > by the same process/file, and taking actions when the controls
> > lock/unlock (such as granting special access on lock and resetting
> > values on unlock).
> >=20
> > This is, in particular, useful to implement volume safety controls, such
> > that only a particular process (that locks controls and completes a
> > handshake) may increase volumes above a given safe limit. It also allows
> > the volume to be automatically lowered if that process dies (which will
> > trigger an implicit unlock).
> >=20
> > Signed-off-by: Hector Martin <marcan@marcan.st>
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
>=20
> This doesn't sound like a good approach to me, and this looks rather
> irrelevant with the purpose of the series.

I'm not sure what you mean by it being irrelevant. A significant portion
of the machine driver is dedicated to implementing safety interlocks based
on the functionality added via this patch. It would be impossible to prevent
badly-behaving users{,pace} from defeating the safety guarantees made by
speakersafetyd (and thus permanently damaging the machine) without giving
speakersafetd exclusive ownership over the safety interlock kcontrol.

Is there something specific about this approach that you do not like?

>=20
> thanks,
>=20
> Takashi

James




