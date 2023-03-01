Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6080610EE
	for <asahi@lists.linux.dev>; Wed,  1 Mar 2023 17:18:05 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id l25so14034424wrb.3
        for <asahi@lists.linux.dev>; Wed, 01 Mar 2023 09:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677691083;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pF8WidGUgZdClTE2SxFTHM5D5u9SZH0JpiUiTRv3sNE=;
        b=CaPSr0tYYn7bLfrrnDMhuvFBzPCZ6oFOM1Rt7jwvJOJuTRXWQPcJ2jVGWzmUOJsbpN
         3e0nN/GU3hbEE/OF6JecTzHyCIdzXoF0nK2sVoOVDQjJrVWDnUkdLVAkIVgBxxnR3JRQ
         4h2efryVweiLEZdRtzi1vOHnrpsg8mUxazvbzJdT5pRj99y+zK39xTiHYELTn7XEwx2d
         3OU9BMfdWrHUwye0AekCVcSeNLOUWo5V7AYCceRbAVek444rIUcKyK3WnzIdaplM9S8N
         WyG5+76ZN5Asi2xi2/FxTpD6pbtV30Q+wHMfi3a4n5v1XaMNTo4UwqG0L4dtd6zERf2r
         BCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677691083;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pF8WidGUgZdClTE2SxFTHM5D5u9SZH0JpiUiTRv3sNE=;
        b=esxxeH1qhGIZ7ODhoK3ho74QJ973Y+EqQIujUrHVCu3AmFJtkZHv48DDnYM9eo8dok
         tusUep3q+s/QsrpAJph5jNZAjlSsrqQ8UlxpW0I3T3zzHy6kd1gWQ5BMb56xDSgS0JX3
         Cg9BXYFlbfPVYKi5u+ddb3fO6eF64hPkeN3NZs/vTbgTlY0DAYUHU0WvNV517E/Vnvyy
         kRptGyEuDlElY9AfiVs9dXVkwfpQ2ouUE6Ie9nfk6abxMHajonxVdX6hz5V4SaBlsFkw
         t0zhzaHqzsNTUPFol6dG2XQMS6LMCiyZRqyGYDjXfhbXooDW+WxtNmgvVuuH0fg0/Otk
         N5ug==
X-Gm-Message-State: AO0yUKVB/wV3Ed0C7t9t5ka+WWNLFjmDOTGKGQTY/ixbx/SvwrLd2G7u
	ZDLrALN2mP7A6JmFXZzRrs4=
X-Google-Smtp-Source: AK7set9d4QepgMrmf+d3SU8o8bFy80PzYhSLxqamhOxlqV4Uf+ksXs7Sq2WOl6+XKeKDnkq4OkaATw==
X-Received: by 2002:adf:e0cc:0:b0:2c5:5847:7374 with SMTP id m12-20020adfe0cc000000b002c558477374mr5315708wri.67.1677691083583;
        Wed, 01 Mar 2023 09:18:03 -0800 (PST)
Received: from localhost ([2001:b07:5d37:537d:5e25:9ef5:7977:d60c])
        by smtp.gmail.com with ESMTPSA id u4-20020adff884000000b002c70851bfcasm13128388wrp.28.2023.03.01.09.18.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 09:18:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Mar 2023 18:18:01 +0100
Message-Id: <CQV7UQPYDLQU.AVIOZFTN5ADH@vincent-arch>
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To: "Asahi Lina" <lina@asahilina.net>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Wedson Almeida Filho"
 <wedsonaf@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <asahi@lists.linux.dev>
Subject: Re: [PATCH 2/3] rust: macros: concat_idents: Allow :: paths in the
 first argument
References: <20230224-rust-macros-v1-0-b39fae46e102@asahilina.net>
 <20230224-rust-macros-v1-2-b39fae46e102@asahilina.net>
In-Reply-To: <20230224-rust-macros-v1-2-b39fae46e102@asahilina.net>

> This makes things like concat_idents!(bindings::foo, bar) work.
> Otherwise, there is no way to concatenate two idents and then use the
> result as part of a type path.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
