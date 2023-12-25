Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C24815A8
	for <asahi@lists.linux.dev>; Mon, 25 Dec 2023 02:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dberlin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dberlin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dberlin.org header.i=@dberlin.org header.b="GvZfp91j"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e7ae726c9so368290e87.1
        for <asahi@lists.linux.dev>; Sun, 24 Dec 2023 18:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dberlin.org; s=google; t=1703471080; x=1704075880; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8BQYZOZnbVB9PzwbG2v3PYjW6IKY3+yuwxChBh9mko=;
        b=GvZfp91j8N/H+vxtSrPgo944GC/uy4qjNFuzOnovN8KMhrnX462UrKh7k/d2tERgbW
         Kr3zeud2N1y47i3etXJULQEVgk5FAGDTuYvwlc2XahX2+N1t1vAsoAe8M2HODe8cMC97
         ZinvaPofiGB/1vGC+s3DG5erhSzcE4D4W6l9w7ke9NohRqK2lGXt+kU9Vd5U91n5vDGa
         mNCaKktniEDLjOeizZmN/nZULZopXSORfp5OkyvshvxTCGhhHT2X2ZuHIiey1jsHVapQ
         O2vB2eZK1kLa5AVblSzrqjl9k9C7cQtiwPN+m0F2kFuSe75g5z1Lj7R3vb2G1Qw2uk+X
         167g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703471080; x=1704075880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8BQYZOZnbVB9PzwbG2v3PYjW6IKY3+yuwxChBh9mko=;
        b=DRRucfZcBqMtm5VeCli/6sNubTUJmFmqCBOinPvluHcZFioBEx2R4stg0CIzJ+kX+C
         +12VPqrswbA9mpOgBhdFOHIuwXIRufQM9/WaMb5XCdE2fO864SZmmaIgAo5DV+kqyINw
         /6g2AXbeerFT8gO85f7sg2Wo4lWQqkski3+EEGqSXHObZjF/ZBBQMQ31lIKuivGDFlIc
         dOnAvkg5RaYIHgZPkKsP8POYvD9pnuCjZBPTeKTkiqULfXMd2fc4HhhNB82GLvkiT9sz
         QszxFDGMoEnYQ8MRYFulx8GPC9fCVIJu/jDbROOZscBcnvZ/g0mfX+0nsrMfQ1d1rt7O
         1ejA==
X-Gm-Message-State: AOJu0YyhaWhAmkfiAv1mwnrsLhrsc6qTJvN2p2o9rtmGf4Zcg8kw6oZj
	Xe74yWVTIz9Wfl+K/H2Jx5QIy4hMoFUdcl649iTDSvjvf466
X-Google-Smtp-Source: AGHT+IEMWuWVz10fbTctYGeIyZwpSrJbyqhL+8q2b+wEvTgLtuEYRklVumBxjKzlWrRhHXFPgwr/hh1/NY4TGZ3BR2U=
X-Received: by 2002:a05:6512:281b:b0:50e:699b:55f with SMTP id
 cf27-20020a056512281b00b0050e699b055fmr2420084lfb.66.1703471080172; Sun, 24
 Dec 2023 18:24:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231107-brcmfmac-wpa3-v1-1-4c7db8636680@marcan.st>
 <ZYK/C3LzK8LMOjER@home.paul.comp> <3e7f9763-a481-40d1-a5aa-9d71ebe13d98@marcan.st>
 <ZYa2Q8ALPbr09L4b@home.paul.comp> <CAF4BwTXJWYGT+8jp9dzxmSN7wbk7xZuy4tNSQDhxJ66UzhhgWw@mail.gmail.com>
 <ZYb8jf3a/CsI3/D2@home.paul.comp> <CAF4BwTXm62PxBTM2bNX2MkTF4XUypNJAMpxMFaQ3LP5MHrfBZA@mail.gmail.com>
 <ZYiGg+B/NsWuR64+@home.paul.comp> <CAF4BwTWpVRZJxQnsqKgvNxvruAnN7C=zH23bSvvJOikg5YiMsg@mail.gmail.com>
In-Reply-To: <CAF4BwTWpVRZJxQnsqKgvNxvruAnN7C=zH23bSvvJOikg5YiMsg@mail.gmail.com>
From: Daniel Berlin <dberlin@dberlin.org>
Date: Sun, 24 Dec 2023 21:24:28 -0500
Message-ID: <CAF4BwTUByEQLFhDNwtf0rtubi+ahqzCG90GoFNdamLLnemOr7g@mail.gmail.com>
Subject: Re: Testing bits/080-wifi on BCM4345/6
To: Paul Fertser <fercerpav@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Staring closer, it looks like there is an undocumented iovar to
retrieve some variant of per-channel txpower that is bounded by the
hardware limit, but
1. it's optional in the firmware, and only compiled into some firmware vers=
ions.

2. All broadcom drivers (IE android, bcmdhd, brcmfmac) use a static
value of min(30, regulatory limit) for max power.
You can see this by looking at how they fill in max_power in the
cfg80211 bands structures.

3. Even when the hardware txpwr limit is retrievable, you can't get it
alone.  You can only get the chip's current regulatory limit, bounded
by the hardware limit.
The hardware limits are also not guaranteed to be static in any
interesting way in the firmware (and in fact, vary per phy, etc)
Meanwhile, the list you are seeing is only updated once per regulatory chan=
ge.

Given the above, I have doubts it'll be worth trying to get it to
bound the displayed limits by the actual hardware limits (or that it
will even give us real values if I do :P), but i'll take a whack at it
after i fix the VHT issue you are experiencing.

--Dan

On Sun, Dec 24, 2023 at 3:20=E2=80=AFPM Daniel Berlin <dberlin@dberlin.org>=
 wrote:
>
> I'll take a look with a pi.  I think I have one around.
>
>
> You are correct on what it should be reporting but it is not.
>
> The actual per-channel hardware power limits are not retrieved and displa=
yed in the list.  They are not part of the default info returned and nothin=
g asks for them.
> They are part of the ratespecs iirc.
>
> I believe I added support for iw link to display them once connected (alo=
ng with other info we could retrieve).
>
> Sent from Gmail Mobile
>
>
> On Sun, Dec 24, 2023 at 1:29=E2=80=AFPM Paul Fertser <fercerpav@gmail.com=
> wrote:
>>
>> Hi Daniel,
>>
>> On Sat, Dec 23, 2023 at 09:43:55AM -0600, Daniel Berlin wrote:
>> > What you are seeing now is the real state.  The chip and the stack
>> > now have the same domain .  As such, those channels were always
>> > disabled *as far as the chip was concerned*, you just didn't see it
>> > because it didn't display it.  There is code in the driver  to
>> > enable vht40/80 when the regulatory domain is set right.
>>
>> The global regdomain in "iw reg get" changes to the requested one but
>> phy#0 is left at "country 99: DFS-UNSET". However that global domain
>> clearly affects the channel lists as reported by "iw list".
>>
>> 1. 2.4 GHz channels get unlocked as they should (JP channel 14 stays
>> disabled but that's likely irrelevant as it's 802.11b-only)
>>
>> 2. 5 GHz DFS channels get all disabled, no new channels are enabled so
>> VHT40/80 are still not possible
>>
>> That's with clm_blob from Linux firmware tree.
>>
>>
>> Another thing is the per-channel power limits reported. My current
>> understanding is that "iw list" should be showing the currently active
>> limit, that is, the minimum of: generic firmware limit, current
>> regulatory limit, the specific hardware limit. So 30 dBm there looks
>> wrong and inconsistent with the behavior of other drivers, e.g. mt76.
>>
>>
>> Regarding testing on this hardware, raspberrypi docs say that Pi4 can
>> be booted fully over wired network after minimal one-time
>> configuration so that seems to be the easiest option for development.
>>
>> --
>> Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
>> mailto:fercerpav@gmail.com
