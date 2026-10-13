Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4C73CB54D
	for <asahi@lists.linux.dev>; Tue, 13 Oct 2026 07:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875687; cv=pass; b=t3zDxPPaMeJfV4ntuO8EOEkDOfnnRFkFMqp1zykybTdZlWD7soYp3WBE05ftj1V2sGyJ4Wfh/u/lvAL6ks7USFbo4E6ggVoz3hJ3N6SAuRfTguxF2vdV3S5NCo5juwyliPzRNgxyXR5u+DVEYyH5KaH+gv6K3jb9T7j9lfxE3T0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875687; c=relaxed/simple;
	bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CluVBzHE6beXWFKZnIAXMQlvTEUxeEpd46Gth47QQTSeNiS7XzTdNRxEAOyHkpOx6DhEVLzd/nDnoL5V6Jw4hqTF+P2eW6JDgFG7c4GDWIFXZMeNKBDu0ece8JIXOZ91AKLtfxu5iWtDwHiUB2IMqQwcA+r8i2IpAnXhhLa+bag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cay2BdNg; arc=pass smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cay2BdNg"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-51f2e9e6987so810246b6e.1
        for <asahi@lists.linux.dev>; Tue, 13 Oct 2026 00:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791875685; cv=none;
        d=google.com; s=arc-20260327;
        b=jAD1deBdNNElLcg0WHOKHdT1OwdB0n8hZhyN1Hylokkn3xW1zyB+h5e+CQF5iMuMnm
         YDeeJMQj03Va1GNYydR6r1PJ0yCY8BwRdoGciixhJLwcOLcaVO13dS4paysJZn76rUaX
         DZZvl5mvEpymaBovOVCRS95CHgcI1pX16hic7HYqelUZkeUwU+5JjBmZYlxc5E4euv3o
         NDvz5i6Va2dHIjJbYfaY9JRBM8BH4O9G9Yc+PZxaF01zmCnkRKCXHNnSAAkgMD+X5ec4
         8XTINuDaasfYLiRWCMrMWf2Te2VLjr7Mfad/TYuSrDvZ5wSKWnLV2j4XIgwZefavzceg
         5Yjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
        fh=Kqx/Wnsf4xtHTsFySnIpBFe63Sww7JhO3yz2hVpFGuE=;
        b=G+vfgkgqN8oEjMCIAIUcd8ZB2lgg67bTpzctZf3wHzpSgQkbvux0i8hjVdQ/qRuG6x
         /GZaQvJ4LTXbYbhz8wEy8+2T29nRQGyX/Mmxo8d4lGJ9TfwnYbOvJvSwiLpv2fBK9sbw
         Ao2leMp21xAf/P4fcE4cpEwFjOEK39mxbL3vAS26QvrYvrjZ9w7x7ZpFklW/KphEsUaO
         h7uMKBVaHbhyl/sxpFO0MByrzBkKfXmpd7CqGLg4mBQ6YZ2y035nUINXlQcQA8f2fTtq
         iq8oH9e3u5DkNGC7HmM04rRinH0uYMHJt8IqZMnjhMJUQ0P1SL26UzZefyYb2TdfZ36h
         woEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791875685; x=1792480485; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
        b=cay2BdNg18QtK14y2uhyreOeN+dksZs5knDgiZ4gWvAO76GDrYPPh7CG6z/sd+H3Z/
         dLgOM7/8T9VrAk8dq8WexnctOGJ/aZkfDwCRMnqT1qoPMS1b9QcfZsgTFAjn+pIAL2wn
         6L1fu6pYEzdZirPww9mEiKtlHKrutAOIb8YadTOhIBejRfhmQXPiLhlS9PeQlEfu6njY
         ESIfyxMvqbvinzWzIg4PzuvLvp2UgtW1sqcw3tE1mCDLXaYpjxELJIwSIiWNXDRuJ6JH
         NQI3mwlw+lvzxCveo1q7enlmXTInBRxh5OFG7SmDW1GhxK6sykiKCxB969c4PurkXuVu
         tF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875685; x=1792480485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
        b=la0br3g7lCKVWU1V3IrJk7YmuVqRDPHEzLvPp7I15xWdHWoky3S+XpuTJ+L5VUjk74
         lxPLF4ufyaTY0BJLsPJ0fZJp8HZx6epXHYDjjrgCzg22s0xzFgpaQPyZPFiyzcwkjfm3
         8Tr4W0l7BCV4HYTGZmTRkMd8SLcCOZ6Ju57J84Ak4yNZbboKZyaHg3A2EROQi/gf+CRw
         c3GJMNSkTkaMsTV7d71zCReyDTn4N1p1h6pXw4ENR/2tXLu+5j5gibXQcK554qj2J2mU
         QNm7Z3JGZQverFNQHpNQuaqcY6Pv8nz8kK9uLDfQKBkA1tjv7tN/VdOZZWSkc5a40FnD
         xgUQ==
X-Gm-Message-State: AFq9FYKBryOezH0tqRmcbupidmo4UKhwuriSVno5ZZW9U3/Lp5KegS8c
	Nzoy4PpSiDIN7jH5waikC9SuOqCfZfvlttwJcQ7vav5emYk7AU5mRscyl1lPZaE2s/FE+w+TPo0
	wbPvQqKYlaMTiqzF+clD+pzeUW89OvRM=
X-Gm-Gg: AYBFou0EAGCadviIOPy7OV0fOWdasxLKXPzFst+MDqAKZIqhmv1Oxr0cYKS1P6CbsKg
	O9LACHvHQkubX13aZvAhKb71JAMpAGN9NduWT8ZS+zsT7E1DFpLLRITy9CNMfLngtGOs6hgSCBi
	O8uyh0YkHlSYhE/6B6pX0BY2yHILTrCaX1GXKQJh+PnaCGcX05Tl7qdc61GdSA5WNXIXMugLiTa
	Rx8sHvtgPm6ALxxrNbK9ALvyHq7SAKEg5opCfN3UMI9yFwR7xTbE5rCpe2fuJEn89bVN3GAyLwK
	9cMIU68XnnpE+Z3ASaAtDd99kFPISfTmk+TLbVSa6IZ6TO3DCqMEs3SK8i0gbmLQxZYPkkWlNmC
	cKh0p42gP8XpXbNdmS84+uIAfDLBc09iKJjvTC5Xk2lUBQvrEZ/wmfB9HtYgV0yoSjf7FkD/pR9
	w5WoMoCUvD53qqD5ELGPejZ7QWnGHUyUeRtbNaADUA/vx5yh09pA4=
X-Received: by 2002:a05:6808:30aa:b0:495:ce6d:7d48 with SMTP id
 5614622812f47-50c4e67cdf5mr8677005b6e.9.1791875685589; Tue, 13 Oct 2026
 00:14:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-9-7b47ed6335a8@gmail.com> <3698d260-13c5-4050-8f03-61f7b7185514@intel.com>
 <l_pd6lBHQaWNYoohhfxhFw@gmail.com> <8fcdfd97-fcc5-4ed9-8a9a-3e7eac53fed3@intel.com>
In-Reply-To: <8fcdfd97-fcc5-4ed9-8a9a-3e7eac53fed3@intel.com>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 13 Oct 2026 17:14:34 +1000
X-Gm-Features: AclHuK8TJXmdm-cxsbCKrijwUibcd22A39HSUGZRpbNW3PHDJmMdVBEajRXhBY0
Message-ID: <CAHgNfTyTQW2vMieSo+U7CTTuckrLZL+PuEKXfKCHYMFDBCFWng@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] ASoC: apple: Add macaudio machine driver
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>, 
	Sasha Finkelstein <k@chaosmail.tech>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 8:03=E2=80=AFPM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
> How does one know the speaker died? Is there some kind of signal, event
> or an interrupt we could depend on? As delayed-work is a mechanism of
> choice here for handling the case, I believe there is still a gap and a
> chance for bad things to happen.

speakersafetyd is a userspace daemon, not hardware. It cannot generate
interrupts. The daemon puts a magic value into a kctl every run of its
safety model to signal to the driver that it is alive. The driver checks
every time this kctl is put (see macaudio_slk_put) and schedules delayed
work for the timeout, resetting the timeout if the correct value is put. If
the kctl is not put within the timeout (e.g. if the daemon crashes),
it locks the speaker amp volumes to a safe level that will not cause
damage.

We do not want these checks running when the PCM is idle however,
so when there are no longer any active DAI BEs, we disable the timeout.

> Czarek

James
