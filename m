Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962409;
	b=c6F6U3O2WrvA3b0ZG681F5MkPXr6IAcllkFS3XXZoo5Of5rMP4cXUQbpf5Q1HjOS8qrK
	 d86LUOAS/kdpnreIjoplfsJDlppu3VM5YhTODmRhZagMX82fykrWTdjxUG7hsWp+hMFp9
	 s/QWMHKscQnL/n6eVo4q7ARQnvXg+A1K5tAkRI3yrwKJUEt4SKV1PRC+nJhYThhX7cYys
	 HI9c5Q3f/swlwnHWq6fudemJJ+KyPvz7J8XO7SSF+8WN2XDgCRkwRj4wNdMUvD89p2XgH
	 OVAMXQZWEOgrgywBju/mDpqAKe4jW9m8WqRUerfNs3o7DkbjPzUP/z5jmqIrcLcSe2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962409;
	h=DMARC-Filter:Received:DKIM-Signature:Content-Type:MIME-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To;
	bh=iEpvVq7FVEoozjtpZonOLgpLctwFwcvJ34eDuYmErQw=;
	b=HaXW5+yS9283ZQRPMfXts4qGLHR4QsGjYYFXo0By0UZvqmIGUqfvOKnyDeD3GqgNIrow
	 1+mEbah1FL3VsBxGHAr7jeE3Zph+NDO07twfAAJ91dpAV5Y7cUXcfKIShxljg1XygQ+Vr
	 IvbYa48eJsuRPZv7E0AypLLFpblMw4Gu8Helu/iUEyZtcj2UL2K/bXqoRQ1Itw8GnvEa5
	 8UqOPZhMnx+NCZbia4oxUUMPdVKFvW3lqaDVfkyg0JDPplIimi1MavwDG7MZfkoXaai0o
	 IVx4IXk4k9BKMSHBnAMkUIs5RsUWIQAxzWslKSFAJIHwrfz96C+KIFV9nPEgRAetBVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=Kqh9JhAM;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0B0606A32C
	for <asahi@lists.linux.dev>; Fri,  6 Nov 2026 10:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C0B0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=Kqh9JhAM
Received: by chaosmail.tech (Postfix) id 567331C860C;
	Fri, 06 Nov 2026 10:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1793962404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iEpvVq7FVEoozjtpZonOLgpLctwFwcvJ34eDuYmErQw=;
	b=Kqh9JhAMCaorwWAMgRue2BDo7gF5XvtgqRVnKhCuS5lMAmpwJ2b8OpG3hgpjumcTNdlELF
	3uZTqbFA/CUAU6nP13O8LbD0f/HKH7zVP5Zfd1kEG2B8jZjYSo8K4V528qL8dGxC8Au2y0
	4dIg3xd22gN3ERCuR/Quxclfz3qIhOY=
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] Bluetooth: btbcm: raise ACL priority on Apple
 Broadcom controllers
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20261106113946.60c6c5f6@kait2en-mbp15-1>
Date: Fri, 6 Nov 2026 11:53:13 +0100
Cc: Myria Sarvay <myrialsarvay@gmail.com>,
 marcel@holtmann.org,
 luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 sven@kernel.org,
 j@jannau.net,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Yossef Osman <Yossef.Osman@proton.me>,
 Aditya Garg <aditya.garg@linux.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5F81A6CC-46B6-4C45-BB05-8483057EEE7C@chaosmail.tech>
References: <20261105085750.120392-1-dev@deq.rocks>
 <20261105085750.120392-2-dev@deq.rocks> <au1uH6uxtsw2vHfP@macbookair>
 <20261106083339.677cc75d@kait2en-mbp15-1>
 <CB3B84A2-76AD-45F5-B2B9-39E5A9ED3BE7@chaosmail.tech>
 <20261106113946.60c6c5f6@kait2en-mbp15-1>
To: =?utf-8?Q?Andr=C3=A9_Eikmeyer?= <dev@deq.rocks>

On Nov 6, 2026, at 11:39, Andr=C3=A9 Eikmeyer <dev@deq.rocks> wrote:
>=20
> On Fri, 6 Nov 2026 10:40:58 +0100
> Sasha Finkelstein <k@chaosmail.tech> wrote:
>=20
>> You probably shouldn't, or at least base it on v2, not v3 (that one
>> ended up being a bad idea and caused firmware timeouts, so Asahi
>> downstream ships something more similar to v2).
>>=20
>> In addition - have your tests included entering and exiting stream
>> with an ACL link active? That part always caused problems for me.
>=20
> Hi Sasha,
>=20
> I tested both on the BCM4364 (15,1) with 2.4 ghz wifi under load.
> Your patch (668d849694ef) and mine, each with a reconnect, plenty of
> A2DP stream cycles and profile switches with the ACL link up.
>=20
> Mine sends 0xfc57 1 ms after connection complete, before AVDTP Open.
> Yours right after AVDTP Start. Both complete with success. Neither
> needs it again when the stream is left and entered, the priority stays
> on the handle. No timeouts with either. The short glitch at each
> suspend is the same on both, so it comes from the stream restart I
> would guess. Scratching my head now. How you wish me to proceed?=20
>=20
>=20
> Andre

Sleep. I intened to say sleep and I have no idea how I managed to typo
it as stream, but that is what I meant. Sorry.


