Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E03CC5E7
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 19:18:41 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1676402318; bh=M5syd+xL2311kuoN57mCyNpR+LmxBuxfBcXd2LTsyvY=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=slqm7+oAI5AgPImuHdj7RJoie1ti4TrUhgx4bs+nyxjqoZHA31ItnK0N3bzKOg2cL
	 J7yWQtIRXOIM+UBkLt7nqXFD+Ex84AHRDOeu/PSXtwfRb//QYCzOehHpp9dsKzSwvk
	 b2wgHhyl9Z2sAX9FKFAuO85DNSdy0Y8RV0QM+m0w=
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [RFC PATCH] dt-bindings: dma: apple,sio: Add schema
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <167638945429.3790.16067227881981242831.robh@kernel.org>
Date: Tue, 14 Feb 2023 20:18:36 +0100
Cc: Janne Grunau <j@jannau.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Hector Martin <marcan@marcan.st>,
 devicetree@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 Sven Peter <sven@svenpeter.dev>,
 asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6B75F1A1-E2DE-40D5-AA79-A764C65D8AD2@cutebit.org>
References: <20230214141053.92731-1-povik+lin@cutebit.org>
 <167638945429.3790.16067227881981242831.robh@kernel.org>
To: Rob Herring <robh@kernel.org>


> On 14. 2. 2023, at 17:12, Rob Herring <robh@kernel.org> wrote:
> On Tue, 14 Feb 2023 15:10:53 +0100, Martin Povi=C5=A1er wrote:
>> Describe the SIO coprocessor which serves as pretend DMA controller =
on
>> recent Apple platforms.
>>=20
>> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
>> ---
>>=20
>> Since the schema mentions a loader preparing the binding =
appropriately,
>> here's a PR with the relevant (WIP) loader code, if anyone wants to =
look:
>> https://github.com/AsahiLinux/m1n1/pull/286
>>=20
>> .../devicetree/bindings/dma/apple,sio.yaml    | 129 =
++++++++++++++++++
>> 1 file changed, 129 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/dma/apple,sio.yaml
>>=20
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m =
dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> =
Documentation/devicetree/bindings/dma/apple,sio.example.dts:24.35-27.11: =
Warning (node_name_vs_property_name): /example-0/interrupt-controller: =
node name and property name conflict

I saw the warning, but since I had copied that part of the example from
apple,admac.yaml I didn=E2=80=99t make much of it. Now that I look at it =
again,
the example in apple,admac doesn=E2=80=99t raise the same warning, how =
come?

This is just a curiosity since we don=E2=80=99t need the aic node in the =
example
anyway (unlike in apple,admac where it=E2=80=99s needed because of empty =
entries
in interrupts-extended).

Martin

