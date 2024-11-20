Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0ED81A2545
	for <asahi@lists.linux.dev>; Wed, 20 Nov 2024 21:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732139705; cv=none; b=kn7kfn+z0QcouHzqGOOEi19EBFGmK5FkH/sOlAXjESABeZJOX5ARdeiKmBGV7yLXoiI4jQgxArDHidIVGIq4wLbaP6QfEhSkd4e4OjKu/RR2IHjpFZp+tyq+Kx8DWzWZEImhbqMFMroU57+VRO3DuCfmyphbi8GE/tVRv3XSvNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732139705; c=relaxed/simple;
	bh=p/2HQRb8DSnOeN4sdRAF0ATMaB8otlVUnnqv1o1FzGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEZ9IjzfgFd5NFxui/fc5/Jb2Tsu6znv0Yo6mcvx9/EkNoXLWbYH/Hp56INM6wlxMNCcEEr0qprGzhS6qx/9kT5nak2H/eCVhBv2/oM37xuqr2/FLivBlMjBHB6NmyyJVUdVU4fNZoAlVAZvNjNMYIFPeQWcSCRGQUat2HjsEms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nqGvbINg; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nqGvbINg"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-211f1a46f7fso42035ad.0
        for <asahi@lists.linux.dev>; Wed, 20 Nov 2024 13:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732139702; x=1732744502; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KJuMd+zGRgDKZ9hMGh3NL+Uf9ATMzUJl+LIc+tHuySg=;
        b=nqGvbINgb0ui9cKW9C/qx/QDzya3NtnMRF9UlPDlBsWNyh9yLlYj6ZssPZODRaEPSs
         Xxw/BTtS/sj9OmZ/vCE15yK7KosT0R8TrNov34v2Vl4j4VDsCSLWmtToJQ1FJaEmKFgY
         /wVRK8ggvf3VRN54ivRB4zqrFJ45nfGAbzAiP2gnUds1uy0yEc1YMoXf3flClGNtKRtb
         ilM9EKwx9XWl7oZB6OC51+EKRKzhjmJE8NaD56BR/Z+GoiS6frEQWDl4Xxl4HFeOp/2T
         DK57pT2STENcZrPSpNi7+02gsPSgDA6Yzj6YK7fDn/W9rMRiZzF06bE7ARM90qO/JH7k
         CgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732139702; x=1732744502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJuMd+zGRgDKZ9hMGh3NL+Uf9ATMzUJl+LIc+tHuySg=;
        b=WmvOydPlKAZAOAvZyzKjTAqv9xENiHAW4TSpl4j6+aYczkSot9rhdoYnlaUf0VGxOw
         2xgc3bN4JF0R3boKiiec3uw1ozh9GzmjYRMix4RZFOCTaUrepjjAaE2farRwqkEloVgU
         WP1U1Z2EMtpfZ2IbUFvMRmB7OBrl34txlQ7bzFkmpWaVe3jy+jNkVreHObo9cgUWGRjB
         eaORYszL7qgujTnCWdOim9VXePHVTAmv1PWMGDeHFR08my93e5SllvHyGJHVSA1Hkc74
         JWaVwjrvFK/6LQza7y2BthXYdrY+HzPweQLovagm/U8Eoz9ERlczKQtfHK3M0sv4Q4dN
         ssbA==
X-Forwarded-Encrypted: i=1; AJvYcCVMzHZxfnVZkp1V5QKzM2npQorTeZVDxf/6Ttu9Kb47NuMTSNGqvvMWzOwmbbdCCTWvVL6rsA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yym80JOhGmjWbG6lJnC9JjU9ivXkrFuTETmGD51MoaHYPpenfwx
	ZTSwlrOsoo0zkj8dWNHigLcT4uQ6HXR+AFAY58LdQX3CAexP8B6byySeHHvjbg==
X-Gm-Gg: ASbGncsY9VhOZIKa7YYG5OidHjYNZMXXCcT938RjqtWg0I2Zm7OZVws5m37EdM1uzyH
	7RgKetiV7Wcgdlm0BaafCKBSJZtQxHFEi2DvHjjLKP9aWv6ZrO3Y6R/5AHk22oXxBrsy23kuQCc
	qZMf6TEUBwbAHBrBACYjbKz1s8R1a2oY2ba469C5G9EylWKbKuSDhRsQIL9NA8ZMp2hqcmcYgJG
	zvzSppmp066dSotSjURo9C1lDcJvaDgDvlQfaGuskt7Aa46UFKXZWycX8wsXW0H+IM0tbUvSxP/
	9Q4wBYAwyL2rLNM=
X-Google-Smtp-Source: AGHT+IGKc9ZvPmJIK0nWwQcxR6PLarmpQvpHzkZoZJMXfvRSrnEfA5c5NwlyeWO3fgYs+0aWUjKJ0w==
X-Received: by 2002:a17:903:178f:b0:1f7:34e4:ebc1 with SMTP id d9443c01a7336-212878a076cmr162705ad.5.1732139701962;
        Wed, 20 Nov 2024 13:55:01 -0800 (PST)
Received: from google.com (77.62.105.34.bc.googleusercontent.com. [34.105.62.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212880d16d4sm271285ad.167.2024.11.20.13.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 13:55:01 -0800 (PST)
Date: Wed, 20 Nov 2024 21:54:54 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
	Miroslav Benes <mbenes@suse.cz>,
	Asahi Linux <asahi@lists.linux.dev>,
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 10/19] gendwarfksyms: Limit structure expansion
Message-ID: <20241120215454.GA3512979@google.com>
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <20241030170106.1501763-31-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030170106.1501763-31-samitolvanen@google.com>

On Wed, Oct 30, 2024 at 05:01:17PM +0000, Sami Tolvanen wrote:
> 
> For pointers, limit structure expansion after the first pointer
> in the symbol type. This should be plenty for detecting ABI
> differences, but it stops us from pulling in half the kernel for
> types that contain pointers to large kernel data structures, like
> task_struct, for example.

We spent some time backtesting gendwarfksyms with android15-6.6
releases to validate the kABI stability options that are currently
implemented [1]. While we discovered a few missing knobs that are
needed, we also realized that pointer expansion limits don't work
when symbols are removed (which is possible without breaking the
existing ABI when TRIM_UNUSED_KSYMS is used), as the processing
cut-off can change. Petr also had some concerns about this earlier,
so instead of coming up with an alternative solution, I'm going to
drop the pointer expansion limit in v6.

I still think that it would be great to come up with a better way to
limit how deep into internal data structures we go when calculating
versions, but I suspect that's going to be challenging unless C
grows an annotation for public / private struct members.

While looking into another version stability issue compared to
genksyms, we also came to the conclusion that private structure
definitions in .c files should be excluded from processing as they
are opaque outside the CU and cannot change the ABI. I'll include
this in v6 as well.

[1] https://github.com/samitolvanen/linux/commits/android15-6.6-2024-11-gendwarfksyms/

Sami
