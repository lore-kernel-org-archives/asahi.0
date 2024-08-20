Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AE419004A
	for <asahi@lists.linux.dev>; Tue, 20 Aug 2024 12:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724155364; cv=none; b=Cvhbsd3v2c1Qtg8BRx39CsnBnQUspP3qYejti38nbTnj7nhmv1/yB4FlTgLsRYmhmfO8Niu4O/+75SgX+j/pX0Y6ncoIGTOWLtYyKp3P2NNrk9Spg7WKgOEBKkrg9AgtGlMK8XWbm1ArGSKM+iVyVEiiSOxHY0Jx7kLB0Dyp/ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724155364; c=relaxed/simple;
	bh=zIT0r5oUZ/VoPNhTbfaUL/D1B33WScmcQrjzUJ1gHks=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CFnZwJZaTVEj5x/0HRzG6knZ+kD4zPPyZyZTVdMKvHjx+4bP5p0kHqigwtEGEYM5Emjg8xnS0gBd8tHC75TRFaaB1Is2HpkHg/6CXoSOeyadnhLC6BR4rnrYb8MDfhY6az/lmOG+3aHsWOTxCeg7u4hr/cPu3sP3fOluKfUSc34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5a108354819so7065499a12.0
        for <asahi@lists.linux.dev>; Tue, 20 Aug 2024 05:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724155360; x=1724760160;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2E0+zUlgLfI+u72KWNPTlcu+1cxyIn6aTgvgxGbIVM=;
        b=RZg9MSE3D4uhiw0SPw+PpE6L7LQ7bHHAgYtOUa6Mea1xl6rnUC//ImUeSmJ93zeAj2
         eC6MNJyXnOAF87wpXaeClZVysFgQSxnVsXUbF6VtquL9x9zX9E3JDM0cTZTBqxmnk8Jv
         bk+zKYtkO6EObyBLEb1TQgPSmMArVxhcSb6iZNNT9dM0xxbHD2MpmjwRfmoheaNKrVGY
         2RPbogIytCd+Z9lw9RF0wcWlKOKwwVIpePuK6h98+QGLXwPLAehOPki3KZzqOGgteAS5
         fyas16pmuYGI6H3DKKO6Cuzo6ib2SIlfqez1gy8LCob9+sREJ+HjS0BBWIWSQTZqYwza
         dIHg==
X-Forwarded-Encrypted: i=1; AJvYcCX8FzT/iCHD9C9B3NpKe6B2PHC+SxRG9meU75ws8dqhTgyNVcfW0ZZZPvXGeHVMsqRnIuAAA2TcMFNQPw9bgJV+I4Op+gY=
X-Gm-Message-State: AOJu0YydGUYaFIIchdjO11Zx3NWgYVQ5uhZHBm+hlqz5MiD7th+TVxHZ
	zVDZQKoXk7Z9khK3QOm7jYAn9Ov6+uPBXjDAqnXInG+pKYXPCKZsZcHCQuwA
X-Google-Smtp-Source: AGHT+IHZDRT1GHvU5vCmOx/idGB1EeTF/Cu9BF449aPw5U0ubkXrv4GLfy+q2wBRA5bewd2uH//iTg==
X-Received: by 2002:a17:907:e2a5:b0:a7a:9f0f:ab18 with SMTP id a640c23a62f3a-a83928d7b9emr922442566b.20.1724155359734;
        Tue, 20 Aug 2024 05:02:39 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83839472basm760152566b.170.2024.08.20.05.02.39
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 05:02:39 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5a108354819so7065468a12.0
        for <asahi@lists.linux.dev>; Tue, 20 Aug 2024 05:02:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX5U7BEEow7uV1ijfsFLY1d/cDOHOHmcLUkSIckEJi/7XiILlIvtRV2HUvwfl3eM2FzJS0T1uujSNmWO+VqPI/dLXGEBzw=
X-Received: by 2002:a05:6402:2811:b0:5be:e1b6:aaef with SMTP id
 4fb4d7f45d1cf-5bee1b6b348mr5076594a12.28.1724155359128; Tue, 20 Aug 2024
 05:02:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Neal Gompa <ngompa@fedoraproject.org>
Date: Tue, 20 Aug 2024 08:02:01 -0400
X-Gmail-Original-Message-ID: <CAEg-Je8=t_cXKsWL0XSx3vF1gsArSWpychfbEf+yjM6wVz3Mjw@mail.gmail.com>
Message-ID: <CAEg-Je8=t_cXKsWL0XSx3vF1gsArSWpychfbEf+yjM6wVz3Mjw@mail.gmail.com>
Subject: Weird failure with bpftool when building 6.11-rc4 with clang+rust+lto
To: rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Quentin Monnet <qmo@kernel.org>, bpf@vger.kernel.org, 
	"Justin M. Forbes" <jforbes@fedoraproject.org>, Davide Cavalca <dcavalca@fedoraproject.org>, 
	Janne Grunau <jannau@fedoraproject.org>, Hector Martin <marcan@fedoraproject.org>, 
	Asahi Linux <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hey all,

While working on enabling Rust in the Fedora kernel[1], we've managed
to get the setup almost completely working, but we have a build
failure with the clang+lto build variant[2][3].

Based on the build failure log[4][5], it looks like there's some
random mixing of Rust inside of C code or something of the sort (which
obviously would be invalid).

Can someone help with this?

Thanks in advance and best regards,

[1]: https://gitlab.com/cki-project/kernel-ark/-/merge_requests/3295
[2]: https://s3.amazonaws.com/arr-cki-prod-trusted-artifacts/index.html?prefix=trusted-artifacts/1419488480/build_x86_64/7618803903/artifacts/
[3]: https://s3.amazonaws.com/arr-cki-prod-trusted-artifacts/index.html?prefix=trusted-artifacts/1419488480/build_aarch64/7618803917/artifacts/
[4]: https://s3.amazonaws.com/arr-cki-prod-trusted-artifacts/trusted-artifacts/1419488480/build_x86_64/7618803903/artifacts/build-failure.log
[5]: https://s3.amazonaws.com/arr-cki-prod-trusted-artifacts/trusted-artifacts/1419488480/build_aarch64/7618803917/artifacts/build-failure.log


-- 
Neal Gompa (FAS: ngompa)
