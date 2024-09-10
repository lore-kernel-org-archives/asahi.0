Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC0F1AAE3F
	for <asahi@lists.linux.dev>; Tue, 10 Sep 2024 21:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726002641; cv=none; b=App4iRhYYk6HXKeyCdWcX74jTVPmu8kUPVU8iY6uKbwu6734xwJPLSb0qDfdfCoKydWBHelmows/1L5/GzsAG0msf3IvrmI7HrgTN99H9oa424DWtC37gTrGn0dkNyQVv9pGxvbeHLOxxfQe7PoPxJVG0tGwu17oMiQCQ8ZTHRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726002641; c=relaxed/simple;
	bh=XE4+e/G/h/a5BwWjufqCbsxsDHKt/oX1Y9qt8d3awZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jBkhpHHyRGr6GOGU/HWLY5TEzUYMfPVqGQ1DxZ2Z+5EM5fSkftyalbA/JWRULAeYFapHnvYlEAkq00sd3Q0xwjEq7kwThcm849hhIr9N2j9ubEYMvxXxmm44NYlPPgAJpGXuQbe1zEU8EQTAhAZZ12Eyt9tI0jspoRwHl5Vo9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cqUMavSq; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cqUMavSq"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53661d95508so36989e87.1
        for <asahi@lists.linux.dev>; Tue, 10 Sep 2024 14:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726002638; x=1726607438; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XE4+e/G/h/a5BwWjufqCbsxsDHKt/oX1Y9qt8d3awZg=;
        b=cqUMavSq/Uz5Zpfg+M8swNDPDd2sPYAqSLVk1oRQrs/CsnC/ohF38Cm2Eta94AkBnX
         ma1o9NB1xK2Jg7TS0MV84oSRF7FWutubvbHC+qoOrtH77KWUY52Q7OI2bScg899PgawC
         fLdRf9bzCJivV2Y9Vgqj3UGczs5+/sxoQgAKuk1qusaXqJkkS7uwiVaJq5BQydjC9W8E
         ZJ8r9/36UNELgLDxsCWctFHS0PgyaR3iuXLK9BPZpekSCmqxf63gtymEY2T9dp5MO+KN
         Mc+OW/UeUGZHNNv6Umin+DfrnfuvqlJgtDMRbVV/fCPo95iVnuyHRil7mqFED0Lj62Bv
         /+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726002638; x=1726607438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XE4+e/G/h/a5BwWjufqCbsxsDHKt/oX1Y9qt8d3awZg=;
        b=vGNahdaszzIgWPYTRPpOQbxVaKvRabsUZnyk5DUwvv8Xw8I0OQRprpcE5a5m76j6+h
         B0wGDw40EqdmQkFCjEuBq2wX0ICGWXdYf9BhXtZmkkFSIDQ/44cMeZRuA2vV656KvkXJ
         CK1m6z2kOswEj5vA74cCWGkgP+zCE9BoygWM/yvSZZnbU/p4GRWWCPGRbY3C+uug5z0S
         kK7HymC7B6G3E5ISpiUzOTKOIaB4ZK0QtLby1+PltNdcgSVFB9SQdNYZiJsqfPaSiSbB
         +pIW/CkxZrlkZxvAMGvRwIgSQnFeLzbjctxCrl4rYg939ZFAqrRuEKVjQYojm4PZPywJ
         G7OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyWwTaZ5LjPEHZX1brSkgFtzb+2g1f2IXtcT10ErDE18WKzLQLvGW4ULfMeqWzN1Ysp+pRTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPAm5jT7HbV4KpMTyfO8BvG0X/HhVDlWl872MPna91VWxKqRj0
	nPdy0iWBhjZDmXgfvshu2e+OlBJV8g5pdGbgBSvHZ4ltwCTJP59qsMubmguJysfzgYd8ywAvLfy
	h2N6WUwUC0Nd9WKWSZNQKcX8q5eYK8WHXPzcZ
X-Google-Smtp-Source: AGHT+IHIo/1g0cKAyt8QSBLpZEYQTEjztdB1IERh1UKFzCf1Ts3Mvd2qv8bZQ+qVA3GI1MbRVcan2+yf5xHv8XmvNuo=
X-Received: by 2002:a05:6512:3f14:b0:52e:934c:1cc0 with SMTP id
 2adb3069b0e04-53674bbe0demr32143e87.7.1726002637398; Tue, 10 Sep 2024
 14:10:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-22-samitolvanen@google.com> <CAK7LNAQdutCiBkWtA6MbVLpfhB-MQXnszQm8eEiBZpeX++5eLA@mail.gmail.com>
 <CABCJKucott2g8mZyJ0uaG+PdPTMsniR7eNCR9GwHpT_kQ+GFvg@mail.gmail.com> <CAK7LNATyv+zfSwyykKQrSjxR84ST0xTyEarnAudF2VuLPVxqnQ@mail.gmail.com>
In-Reply-To: <CAK7LNATyv+zfSwyykKQrSjxR84ST0xTyEarnAudF2VuLPVxqnQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 10 Sep 2024 14:09:58 -0700
Message-ID: <CABCJKueSe0TT7HnoJULVZfz6t8x0WjkWksZ1hzBY7SZQm6iYgw@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] tools: Add gendwarfksyms
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 2:44=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, Sep 6, 2024 at 5:53=E2=80=AFAM Sami Tolvanen <samitolvanen@google=
.com> wrote:
> >
> > Thanks for the patch! I think this would otherwise work, but I also
> > need jhash (or a similar hash function), and I can't combine the
> > tools/include version with this, because it ends up pulling in a
> > duplicate definition of struct list_head. Would you consider adding a
> > hash function as well?
>
>
> I did it as a part of my kconfig works.
>
> Check scripts/include/hash.h added by the following patches.
>
> https://lore.kernel.org/linux-kbuild/20240908124352.1828890-1-masahiroy@k=
ernel.org/T/#mea41ff4c5b6c77aaaae1ed9dac6723bc2f705107
> https://lore.kernel.org/linux-kbuild/20240908124352.1828890-1-masahiroy@k=
ernel.org/T/#m9050a270fedb7df9a54e843674bc9ad8fd068f57
>
>
> I think simple helpers are enough for name_hash and addr_hash,
> but please let me know if you encounter a problem.

Great, thanks! Looks like this should have everything I need.

Sami
