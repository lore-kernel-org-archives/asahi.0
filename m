Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531E1311957
	for <asahi@lists.linux.dev>; Wed,  4 Mar 2026 12:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772627194; cv=pass; b=nioAT85SiTKnoIt2t3uD9vNdRqNGgQ/Jvurkrpf3aZnBjeFFd6SdPHTOsdzqPYYlVDifJ2vVT+trXxnIZucsps6fWVBAdE0TqNWfZMKoxQpTJ3GLe5JmYxSqmdMrMLG+Q11yTgyz2MPumE6Ooxv8GTEiVAwGRSv4dET9Wjf8yTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772627194; c=relaxed/simple;
	bh=wtueJCBBCEMMjfOCs5Mxf2bg8BKuT6JfLOlp5ygER1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNbtBvJ2IAW0Q1mAK11RKhTC+MVcmufNvmeCq4GU4bDLF7+RXeghHj90QgjGoFVhJ4t1gBTxS9tPrAlxG8QYTFglGhSf5AGQSLpqP4oN8qYItxLvhxDZEogaLAwrXENJn6hItbXlcOpcqRPSHDbfnBn66f0jr/krxj+dhGKVD64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIsSONiS; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIsSONiS"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1273c690e5bso282530c88.2
        for <asahi@lists.linux.dev>; Wed, 04 Mar 2026 04:26:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772627192; cv=none;
        d=google.com; s=arc-20240605;
        b=Ufwwnp5yLzQEThoZuLSJf6jgYx5jK/JtLJBIPrPc+Ov3oiV+1Hdi7LqvkVcNXTBUIp
         mx8VFuc7yO8BMlmX0FjiAcx2MqAeQM9pfCqPg7mHy8BfoFwWb4EFWlurTKRTL/phNOIu
         xxE83G+TjW+gtt64dvdcXblfCqvimvhETVObasUIjFJV5uVLMRtyzNqOl6z5ftl4S19V
         ekUTq7Zge+4hgsz0AzCs+/egU6dxmqvKq7XgmCGDAsR5v6WcDnQYVorXNDgVSyMnwiXO
         qJathtZCdWHL5/rHfpQ/zjV2XESiHJAhgF20mxF2vo2aMMQEI//0s8IIhW/2pwvfGUA5
         TJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wtueJCBBCEMMjfOCs5Mxf2bg8BKuT6JfLOlp5ygER1E=;
        fh=VI5AMLNskN6P13H5SODOXChsNiedoYmp2hKq/5F9EQQ=;
        b=alHPr8NodMW/1T50vFgoc2IN6uV/Kvgkj1r1XhNPWEFdpOXrBgY0jdvO8g+qjYemFg
         QP2SELSlqgEmUAMOtLs6eGqAwO9ozNC0gyyvCNsSFjmYxwRIeMqxQpSZZl1DbrVQheUI
         cizANjPM036s95m+yxJvIyyyqkPMNWmhcrb0yejQZxYYq5NM9te2/dkxqsCERXC1MJ0T
         a1bmxlDn4Xe8IaBIszPExz4wqT9rIT650NnK+3bwzgmiZO3xtrWrUd1X2quEvOceDWuk
         xyivOP9yfPVEvPTP1yZF/layUzXNH03AdFsqoxLaho9uFJoQ5sX0LGIE2anV7G2KJ5Yh
         Wf+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772627192; x=1773231992; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtueJCBBCEMMjfOCs5Mxf2bg8BKuT6JfLOlp5ygER1E=;
        b=SIsSONiShMQYc6x+drVzB+SwaefD8mJzlrJmNuWWLBD9E1bXD/rMHNSxfCtrRZSiON
         gGPX2sq3krhEImlcqbhW6n+O377eGAe8wNzq31ugHm2PYR9eBVxfg+y0AK52Q9hpGZq2
         C21/4u+ETLpYGCVP/blR/HhFbYxyC4hdVCjOaO2EN/0ltI/N66eKJXDqyEpX4aYw662e
         flE7aigyC/3VhQaMlqd4+6UggDQ9RpVqhUoPh3wR6tqdMt08sv4EBxUiXx5bmicAFnTw
         mZq0FIKA/8F5fUKSwjInDsdXdtvNWbdaSVN8LpbV+z3j2kgAxukpXyDBCJS64/4BJ/Hv
         DD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772627192; x=1773231992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wtueJCBBCEMMjfOCs5Mxf2bg8BKuT6JfLOlp5ygER1E=;
        b=sG5kZkqVGsUWnRUuAushUIqg5vsaIUmZQtTD8Q54jie7LDy337r9DQMN9dafhDuJ8O
         Ucy6SO5gR1k66oPCAZTsA4KuCJFEDz+IePcAS5F7+A9XgaJgwBJ9wF6UFat1TK0Cej64
         EdoGvie65EJ+0QpQ72nv4ddvniG/uh0vU+2S2zoTx33mlJ/ZJks3PyYMWn3Q8inrXM/a
         tRvz1e3eJKjz+cKCJ0l731JMH0agbPibIRLKnMRl9swKoy0hDnzd14284FyLVQwbd8kJ
         MpMarWbr/UOiPYOMRNm0tAkcqcQHVT2UCGEuuKYxuTCA9IxPFdc8jxQgq8vuRxkfgnRG
         68aQ==
X-Forwarded-Encrypted: i=1; AJvYcCW208GWBk+3dOehN8dwxVzFj6XKb3yZt5TusSd5HQeX0bR7MNfjagJ4dP5jWgcUWJhXSqV2+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/K2952Sa/clVOivVjZlYE8/lZvO8/7Xb+L4JSTI/ntOJnoUJM
	mpC8Gczs/MQxf3w2DCJOxCeSv02L2Usz+oX5y95i9m57WrAjplyhplcrGkToXyMV3tARWNt9OGT
	y71gE0QundYkW/CMuaH0x45AuFlRTFkg=
X-Gm-Gg: ATEYQzxIIqt5KjZI1iu1SfupUpH/RvKaGeEgJLjGoTh3SR/XY/E1qRPN4Yhrl/ekGQ5
	eZWdYNdLIBPW+Gq1FKGD3bTE/x8cOn2k09cmUpFzaUIFtziDEQjoIwxnXcMvqzDemuanVexaUxw
	VokfjMBlpAixb5hVtNh1ZxLE5uvlkr1Uw20RMe9ovhZ+e6zW7foZ4j3KojbSMStNlh03iFu1aBr
	XbxdFOwupQZwBzoj/jwlHXFNzZ69YE1c9Hj6FnbUl0lU15RofI8yFgH9BwOJbpuMmO+0BipYlC+
	UiqBCrd6urdTGDgA8S9N/NIt14I57UCD0uy9CG5aINgiHAj7LcO1IwOoClG/8rg3NwaqrrrRCqK
	bdDcUvex/krkTXET9/J2FyBI+
X-Received: by 2002:a05:7300:a483:b0:2be:171c:2177 with SMTP id
 5a478bee46e88-2be311d4088mr330124eec.7.1772627192327; Wed, 04 Mar 2026
 04:26:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302140424.4097655-1-lossin@kernel.org> <aabGlKYNd0CrO7_f@google.com>
 <DGTSY7NPZEDA.27MENGDJA87B8@kernel.org>
In-Reply-To: <DGTSY7NPZEDA.27MENGDJA87B8@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Mar 2026 13:26:19 +0100
X-Gm-Features: AaiRm51LnBoGAWzHTv7J2p-I8X53qmAWI7PHPSJeyTzO5jsiNAGKX0S8c6BsfoI
Message-ID: <CANiq72kNdc7=-uoWXBpxkn2No6-Z0hVnx_yWMNphyTVscsMkUA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: pin-init: internal: init: remove `#[disable_initialized_field_access]`
To: Benno Lossin <lossin@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Janne Grunau <j@jannau.net>, asahi@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 8:00=E2=80=AFAM Benno Lossin <lossin@kernel.org> wro=
te:
>
> I figured that we can't really "close" a Zulip topic (we can mark it as
> completed, but that topic was originally about the field accessors, so
> not sure if this makes much sense.

Using Link: instead of Closes: is supposed to mean that only part of
the issue is fixed, i.e. whether you can "technically close" it or not
is not important (e.g. Closes: to an archive like lore.kernel.org are
very common and actually what the docs mention as the first use case).

So I would say Closes: should be the "default", and Link: is for
particular cases where an actual issue (or message) carries several
topics and could be confusing to have several commits with the exact
same Closes: line.

In the case of Zulip, we can link to particular messages in a single
thread, so typically it is possible to use Closes:, though the current
UI isn't great to see where exactly it was linked to... :(

Anyway, I guess the inspiration was the similar feature from forges,
and perhaps in case someone has a custom tracking system that actually
auto-closes things in a forge, but it is a bit confusing. Having
allowed "# ..." for Closes: or a similar Closes(foo): instead of
reusing Link: may have been better.

I hope that helps!

Cheers,
Miguel
