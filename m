Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EA61D0173
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 17:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729705614; cv=none; b=M0s6DQvRGGDiOPUCEZiDw8CQG1NV7m66yyYFfCPKWaYbwlZM8LPO4KEemQE4EqWb6f+xutzlkYPzlMFeGRnLgAyzImapZ6v5otDrM6foeGMmx1RIzROMAxcXdKazpDDGkU9CP/BsJkCn3N6NQpjYAk6f8mWdTTTzmRmtycsRhFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729705614; c=relaxed/simple;
	bh=i+7ZAlfoQfuCxLYaegZtLOps7LaYlV1n5wy00nEl8Ng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4vDbq/ZINa6Zaxcq9mAl5SqS8ETLj752HpFGKnph9E+qkAab1tkYDRrd3Max/S/K1y2hgrjth8EfKN+kNhYeVYAzIxX41OElv9UZHcFUou6zOUDyC59aMqQgrtxM89GCve2mIJGglZyhDXEGRxfS+YPYAbnWQaapFavqQrKGwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zf4kVp0L; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zf4kVp0L"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4315a8cff85so321685e9.0
        for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 10:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729705611; x=1730310411; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+7ZAlfoQfuCxLYaegZtLOps7LaYlV1n5wy00nEl8Ng=;
        b=zf4kVp0LK+v/yykkKWMQVUw4gnNCnGf4Cb+JsxASp48EKVHcPHQRIJwhr6or9RAdKl
         d+OJDUOq7+hCtYHh368Mkm8S0VQU2mR4L6Nhxwk+ycEUUyz99B+8yh0XKoGjqeWkY1fw
         q1kuaNSqr9xhx/6RoH8gv0uqgr4q5j4vLEVrtGzxm/7XZHMPy5C8BpqnjMSbVHno+1rr
         e4FPBa/UwNNNTp0yiklTbO1fP+n3mJK82QyWc7FIDI/kOJ/IKS1OtDClz9Kv1PvWzg8p
         MGJqC253oxEuSJrmWwsKwulMqdcdqDHH0DaH4bl2qPnoz1unGERaU4cmr6+DBiqhWyn4
         KtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729705611; x=1730310411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+7ZAlfoQfuCxLYaegZtLOps7LaYlV1n5wy00nEl8Ng=;
        b=Robikg1AQKKBPPvh8FHm3H70BGAqeKrtxaxQzM2CAQzkwpIrSZkymrVMloFo1RIE9Z
         ZDedaD8pHcYRSaUGXApiE3mZiBIrQwg81dFLVvDrXPs5bmQ7AW9TAQHRRu9WdDoFzNgU
         tkr5vG81D2Aa4F6FiC3z9SesmdZdS5Gj8GSP1TktFqIcGK1Qo2UaXrA5HMowsWYgOT+/
         gP8vwZ6fw4sBFM5dGaIXJBD7+Tc3nlXJf1nYJCvVYCeddSmLucHlsZQpwLKknnxEmR6Q
         oBTRmpGbeehYTvUA+ccRo9bcT6nsNC7va+CszEu48GaG1K2h1peo7XhNU0zyEtrwBtKH
         CjIw==
X-Forwarded-Encrypted: i=1; AJvYcCXjux6efWc3x85GwaHh3CYb2++faclnm7tc5H2fYwpW4M54c4dBkphEr1nvf2OSzke/kY3U8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm1qne/mVKePEahGh0oqDwsPjKO0jz1VVa/kJOJ8jnc3O/Jq5b
	IunSGNePrgTvkzDBvhWuunv4kCDQfwWBvnxTX6bCfWNYqOkhIWFVFvogWjSdR/3aqweDRwsjygR
	6KDyctc7sle+g1iwXvzrv9Z/RPHOTyxUlut4+
X-Google-Smtp-Source: AGHT+IGczg9abDGpX4ppjcVsgb3ui7YwoWlv9yFaws8RHe1ZuuGKPzBA2axsxRP2DJ+N1UUksoNEjs6hJSoRSIvhZtM=
X-Received: by 2002:a05:600c:3d0c:b0:431:416b:9ecf with SMTP id
 5b1f17b1804b1-4318a55bcccmr78525e9.6.1729705611429; Wed, 23 Oct 2024 10:46:51
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
 <20241008183823.36676-34-samitolvanen@google.com> <8fa10131-fae2-4052-b541-e4a6ef570d63@suse.com>
In-Reply-To: <8fa10131-fae2-4052-b541-e4a6ef570d63@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 23 Oct 2024 10:46:14 -0700
Message-ID: <CABCJKufGTitE6bWwoY-5Pr6MfHnPu2m+RVk4UcZMik=Nri-=kQ@mail.gmail.com>
Subject: Re: [PATCH v4 13/19] gendwarfksyms: Add symbol versioning
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Tue, Oct 22, 2024 at 4:48=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> I had some minor comment about adjusting the name of function
> symbol_print_versions() and possibly changing sym->name to 'char *' on
> the v2 of the patch:
> https://lore.kernel.org/all/286b1cc5-1757-4f0a-bb66-0875f4608c7e@suse.com=
/
> Please have a look, it seems it felt through the cracks.

Sorry, I missed that somehow. I can split this into two functions to
avoid confusion. Also I'm using const char * to make it obvious that
the name shouldn't be modified by users of struct symbol. This does
require a cast when freeing the string, which isn't ideal, but I feel
it's overall not a terrible trade-off.

Sami
