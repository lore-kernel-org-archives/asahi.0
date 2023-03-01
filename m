Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1525210EE
	for <asahi@lists.linux.dev>; Wed,  1 Mar 2023 17:22:30 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id az36so9099823wmb.1
        for <asahi@lists.linux.dev>; Wed, 01 Mar 2023 09:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677691349;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDQHP8BG8R5wdJ7RTb+80l2ekEuyVXCqz8ZnvG7NU2E=;
        b=MXqcEB1rg/3NyMESFE4svUXado9uxbiDrvKogUtcjg2aU575GuICui5bKmW+87FGKM
         OQIgHtE6lZ1rLlCzzoJwXR5yPulcZM/PumnU+lOGTwKL6jnmiPQhxcRn94NIithJvg/a
         Yy2M7jN5wkOI9txLQZw0wNcP4db11DaA8wmIQSGjnWLUAuKXH2CiUmPa+5NRNy9OMuvr
         OD/xdxkSHQsieJYpbtK7LjQwBRnvJSlUFBGTl0leWHR2Az/iixiPZJg4iye1bQW8w7CJ
         y8sUsxOY5CT3nRjzfZPMlW4BRnk93AAlX3L0DrZ8z8iojrpG5/+bjuJMyJ7WwWrcDff/
         lCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677691349;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kDQHP8BG8R5wdJ7RTb+80l2ekEuyVXCqz8ZnvG7NU2E=;
        b=KmF8EtVEJkcLmDuOt2BOaOunh0/ytqe0njWdSsEq5NC5ARKMPvRqZSwBw7bxhRTZ0T
         Uhcr8/OhDoMfi45oS0OMf2kom8KluolqfsEZVUNjzj3X6VCwDs097ce0k4LnPgUa5YEt
         Qzk7p5YL179cyXSYWUMQvuQq8CoRs3Bn9OEM1tqDtZ/UHTMYQ7VAUTJvIPeXfWW0b2cd
         vRyodlII4QI2cIjQyThtAR/NFlphiNQHqV5ix1vajIKhUMLopwCDQOPF+xUWAHUOlYoq
         m9K0Kw+KZoS3LB6CBacb1nzh45+rAlEme2fVjG1+gOhcaUF5acqkcoBNorPd5NFkoGQe
         cJRw==
X-Gm-Message-State: AO0yUKW3ZkkFuPpVAAMOejcdphiAOMixh+Zq8lvND4+tDXpuSFHfUzB6
	h8RV5taSofontOgRLhIYcew=
X-Google-Smtp-Source: AK7set/xIQTGZ0oSP5Ir+iPChbH3yS0TpDGFVtf9t8yYtqEV3aMhGuoNbxDpLj4X7tn8uDDYAraJpw==
X-Received: by 2002:a05:600c:3507:b0:3dc:4fd7:31e9 with SMTP id h7-20020a05600c350700b003dc4fd731e9mr6131748wmq.7.1677691349057;
        Wed, 01 Mar 2023 09:22:29 -0800 (PST)
Received: from localhost ([2001:b07:5d37:537d:5e25:9ef5:7977:d60c])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b003e0238d9101sm178410wmq.31.2023.03.01.09.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 09:22:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Mar 2023 18:22:27 +0100
Message-Id: <CQV7Y50LK5UL.2YJUX3W7B4NU9@vincent-arch>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <asahi@lists.linux.dev>
Subject: Re: [PATCH 1/2] rust: sync: arc: implement Arc<dyn Any + Send +
 Sync>::downcast()
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To: "Asahi Lina" <lina@asahilina.net>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Wedson Almeida Filho"
 <wedsonaf@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>
References: <20230224-rust-arc-v1-0-568eea613a41@asahilina.net>
 <20230224-rust-arc-v1-1-568eea613a41@asahilina.net>
In-Reply-To: <20230224-rust-arc-v1-1-568eea613a41@asahilina.net>

> This mirrors the standard library's alloc::sync::Arc::downcast().
>
> Based on the Rust standard library implementation, ver 1.62.0,
> licensed under "Apache-2.0 OR MIT", from:
>
>     https://github.com/rust-lang/rust/tree/1.62.0/library/alloc/src
>
> For copyright details, please see:
>
>     https://github.com/rust-lang/rust/blob/1.62.0/COPYRIGHT
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
