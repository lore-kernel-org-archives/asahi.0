Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E91B3C3C02
	for <asahi@lists.linux.dev>; Wed, 15 Apr 2026 15:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776266379; cv=pass; b=TifcLK4qyhwhdVNiIPvpt/BmwL8Q3l5ERwFjA8YUDk/TLCuQyh3MgsRYUsSePkgU6M/M6JWsPleMEfsTy3qld5yjtyMXxUqHxG8mlYG8pPZ24ROHANXQ6hMjn/GHVTi4P5PkcEL/LYp9ieujdGZ4YQOh8tPxKTcZhFOF/VO4Fm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776266379; c=relaxed/simple;
	bh=R35x7FeinH2LTmH0GOByVG4M38bJg/xLsvDfT8GEsJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s05GnXZYKVN+f0vrv8S9I2nppR3h85nADPAMbZ2IMSsWb5ilWcMhkMcxiQhWJ/Gqn2ICxw1yq+thaXJVxZbf9xFlje8ctMPe1/lhdMghkqnXDpRb3tl6bDHkR6CpkLGFxk4Ei1IeFiIE4EiLlDdrH0LaCvSqjrAVMTWtaY2Crts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrMpBypw; arc=pass smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrMpBypw"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7dbb89ab229so5999545a34.1
        for <asahi@lists.linux.dev>; Wed, 15 Apr 2026 08:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776266377; cv=none;
        d=google.com; s=arc-20240605;
        b=ekkSQAHjlryEbIGJyxnVe8FuMugIT54d3KaYbzqSkao4CCiqfFdtmmCx68K7fnPK6U
         /9JdI0Ok7TdufPv8nHfU33obaQAXd32Y6HHWVwxfGbOWeSYqmTROrN+3LGdnCEWAVJrN
         GOEPbrLG7RrIOJWxHVPUuEBFaD+kJ6S55e5R+3+Jyeu3FtMAli8dZQfcwMhLoSOMpsV8
         QmCGcKm5DafH0h1+ueMLdqsnXmdZRqyaqQHfvxm+qw37Sh5nQiirKj2Q9PGXDFFHiSoK
         LeZ0YePauMDr9yzdcap7DF68zVI2YXE1Hijqtiuccihpb3toXKjf1bkp27Y3+9YRDI1s
         G6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1VOuNwEfeozQq2kMUhcXYFUYg+uJ+za15jc5bP91H/o=;
        fh=4AoF2/UXbrNvf9aoM3qLUBfvMTzCIlUfYvxkLDsjnro=;
        b=Ui0orwrPIZw+kdx6e1GiFESGqLPnwQXGM1ld4Ei3cw0/uMWKjHp2kL2z2o/objWD5Q
         no1adO45AFSBAhwMC5IhGxLHnNm+ATJ692HuFdN8hVGLauRmVJLh5V4jEW6H4SAiRgAf
         XXvokf4qLO3oky2Vic2nXpESGIdxtuf1F2hkkcZ2zgZRq4XAIEaKEK7t7BGZGvMGnmJH
         QXMHq4q/eMfE3V3nuaxjzNdLRzr38JZ+PSAx/zyAkBg1MdfJ1YNUhTWQU34zt7qlbxpm
         rFGBljLRfLaXn2t+2AzqkiP7xmIHmYHKIIXjcQHPlnJtwv/DuYGUUffQYvha78/7uboT
         Njyw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776266377; x=1776871177; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VOuNwEfeozQq2kMUhcXYFUYg+uJ+za15jc5bP91H/o=;
        b=nrMpBypwvW48SNLPL6ba5kqyuCHNk9uHq2O1hg0sYen4xUO8bppdTkKYngNIP0LYxt
         X/xlSa4lzdmpZemZDBFImxdrzgz5SDXhHbQGatQnVbHy/5PeZ9kn8Jj9FF1B6ylj1khT
         G00xRix1suZ18ZhGKeyB3Zpwu87YvDl/Y9ZMiXQ4aVc2sPw2wIOiim5WOxUno6CHvgvi
         ons8srNaS7+iZg1TY0CcYv5R2r8fEHtSASBOnjKhFLZ4kW2kxrezcQSX3t/SMqwhh+l0
         /D47WI5mOWheXoZhvrGGh7kSf8WQ7DdGTknvm23fgDAuBkN/w/4Y3x5L3vQ+sjtitdzm
         KpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776266377; x=1776871177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1VOuNwEfeozQq2kMUhcXYFUYg+uJ+za15jc5bP91H/o=;
        b=AC39yUcS9zYdSbqmAD2QvFPj8ArkmURAjb6FyIQrQHGW63Q93LJTCkjZ7FsuSuG4Nb
         YUO539eXNF0XmvlOQd4idKMOJxQ9hAaSrLT9RkeTT0vKpOftOCQhXbyAa1IimH1mSgrM
         tue+jTiG+w4vcVIHwwBItvVipTaACantxNlgvW9KmzcP/5wG2w9wUIdaH76d2mLyAQcj
         K0ki/9Mkh0I3Qlh6q/wRp531dfoPD/0zxqilV1MKqGPCwmkeQl7VLscCCu75SGO/rl03
         P8NpS0BrdwomNd9KyWxMWD0M3AD9frlM1JzMoG4cXlW80cnUbi5+I/5ARvhr8lTQeM3e
         9LiA==
X-Forwarded-Encrypted: i=1; AFNElJ9XC9Pd9la5GwXywbPUP0rfnS6HJQv5l6kxbzmEomw0uecs0VN+GqUV3/WpbFu9Oim1Se8omQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb/veep/EiMMyuYVgS2ogTypyqB34Fo6C4EBS9Qdg/lNBYD3WN
	hneowr2P+XaBQz44o5Lk4x3bY3X9BPULPTPC4HIXBRLT8TSA3B0ff9xZmoGte6HnakLjZW8fgfq
	7MKAC3gBSoOEYx/rhyPKbL+Mch+vHpQ0=
X-Gm-Gg: AeBDievKYTGOQcLQYRu63ZAj441U3C2zGNTl4qQi3mswRMkQ/b2W2aKTE8ZBHXGfio8
	Np/AMttDIT7bvTzDkrgmL6GVeTNIwdv/v00pWFm+nGxbAHYb7qAuNed65QalUQHm/b1GobzNcJl
	ho7Z8Tf3ih+8uRhcLL727uzzejdIzEd/7KsRRe/XLhaOaM6PWrSRgC6e75WSrqITItZd6COxKew
	AU49YtQlUiZj1zD+h10pndEfApVTGQIdjvPbyHDotuw/eyRq8YAvX5RddtnP/vVmq9kTW/05KAs
	qyddE+i0ifeIB3dMbZkweW47o7rrNLqtqCPmxzs6a5wIS976M2XcuoManIOxBKzclae80Q5dhGn
	FUg==
X-Received: by 2002:a05:6820:98a:b0:68c:a53c:8ff1 with SMTP id
 006d021491bc7-68ca54bd3eamr11009276eaf.11.1776266377081; Wed, 15 Apr 2026
 08:19:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260407-brcm-prio-v2-1-3f745edf49af@gmail.com>
 <CABBYNZJAEqwfTuVqbFAnx97HBSjcwn3Hb+y+r4r2C=MMPxFoDg@mail.gmail.com> <CAMT+MTQ6orj5tpiGL9hz8m2TGiBjA-9D_0e1iLt=_dXBFHcOgg@mail.gmail.com>
In-Reply-To: <CAMT+MTQ6orj5tpiGL9hz8m2TGiBjA-9D_0e1iLt=_dXBFHcOgg@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 15 Apr 2026 11:19:24 -0400
X-Gm-Features: AQROBzDwk1p0rJ7IlG2lPh_IuUkTifTHO7F9HnsebEPzRDlTsV8TRziiZbRGV7g
Message-ID: <CABBYNZLNR8hYS9jLLKeB=M9XVvtSFtf1wi4DmcJKBbQVvHTPaw@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: Add Broadcom channel priority commands
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Marcel Holtmann <marcel@holtmann.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sasha,

On Wed, Apr 15, 2026 at 8:34=E2=80=AFAM Sasha Finkelstein <fnkl.kernel@gmai=
l.com> wrote:
>
> On Tue, 14 Apr 2026 at 16:00, Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
> > > +       if (sock)
> > > +               set_bit(SOCK_CUSTOM_SOCKOPT, &sock->flags);
> >
> > This is more complicated than it needs to be. I'd just add a new
> > callback, `hdev->set_priority(handle, skb->priority)`, so the driver
> > is called whenever it needs to elevate a connection's priority, that
> > said there could be cases where a connection needs its priority set
> > momentarily to transmit A2DP, followed by OBEX packets that are best
> > effort. Therefore, `hci_conn` will probably need to track the priority
> > so it can detect when it needs changing on a per skb basis.
>
> I have tested per-skb priorities, and unfortunately, this does not work.
> If something tries to send a low-priority packet (for example - a volume
> adjustment), a priority drop causes the same kind of dropout that is
> caused by scans. It appears that the only way to make this hardware work
> is to set the entire hci connection as high priority for as long as it
> is being used to transmit audio.

Ok, then maybe we should decrease the priority, so it can only go up.
That said, in a multiple connection scenario, we cannot really tell
what should be prioritized if we cannot momentarily decrease the
priority.

--=20
Luiz Augusto von Dentz
